module V1
  class UsersController < BaseController
    # 同步用户信息
    def create
      current_user.update_attributes!(user_params)
    end

    # 同步微信手机号
    def weixin_phone
      result = current_user.update_weixin_phone(params)
      render json: result
    end

    private

    def user_params
      params.permit(:nickname, :avatar, :username, :phone, :email, :company_name, :company_addr, :company_qual, :area)
    end
  end
end