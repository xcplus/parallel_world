module Admin
  class AdminUsersController < BaseController
    def index
      sql_content = nil
      sql_content = ["name like :name", {name: "%#{params[:name].strip}%"}] if params[:name].present?
      @admin_users = AdminUser.where(sql_content).offset(params[:offset].to_i).limit(params[:limit] || 20)
    end

    def create
      @admin_user = AdminUser.create!(admin_user_params)
    end

    def show
      @admin_user = AdminUser.find(params[:id])
    end

    def update
      @admin_user = AdminUser.find(params[:id])
      @admin_user.update_attributes!(admin_user_params)
    end

    def destroy
      @admin_user = AdminUser.find(params[:id])
      if @admin_user.id != 1
        @admin_user.destroy!
      end
    end

    private

    def admin_user_params
      params.permit(:name, :password, :password_confirmation, role_options: [])
    end
  end
end