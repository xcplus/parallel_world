module Admin
  class SessionsController < BaseController
    skip_before_action :required_login
    def create
      admin_user = AdminUser.find_by(name: params[:name])
      if admin_user.try(:authenticate, params[:password])
        cookies.signed[:blckd] = {
          value: admin_user.id,
          expires: 1.week
        }
        render json: {ret: 1, data: {ent: "登陆成功"}}
      else
        render json: { ret: -1, msg: '用户名或密码错误', data: nil }
      end
    end

    def destroy
      cookies.delete(:blckd)
      render json: {ret: 1, data: {ent: "退出成功"}}
    end
  end
end