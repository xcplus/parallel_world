module Admin
  class AdminUsersController < BaseController
    def index
      @admin_users = AdminUser.offset(params[:offset].to_i).limit(params[:limit] || 20)
    end

    def create
      @admin_user = AdminUser.create!(params.require(:admin_user).permit(:name, :cid))
    end

    def show
      @admin_user = AdminUser.find(params[:id])
    end

    def update
      @admin_user = AdminUser.find(params[:id])
      @admin_user.update_attributes!(params.require(:admin_user).permit(:name, :cid))
    end

    def destroy
      @admin_user = AdminUser.find(params[:id])
      @admin_user.destroy!
    end
  end
end