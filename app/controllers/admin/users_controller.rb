module Admin
  class UsersController < BaseController
    def index
      @users = User.limit(params[:limit] || 20).offset(params[:offset].to_i)
    end

    def status
      @user = User.find(params[:id])
      @user.update_attributes!(params.require(:user).permit(:status))
    end
  end
end