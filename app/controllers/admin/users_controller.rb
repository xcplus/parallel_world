module Admin
  class UsersController < BaseController
    def index
      opts = {}
      sql_content = nil
      opts.merge!({status: params[:status]}) if %w{checking approved refused forbidden}.include?(params[:status])
      sql_content = ["nickname like :keyword or phone like :keyword", {keyword: "%#{params[:keyword].strip}%"}] if params[:keyword].present?
      @users = User.where(sql_content).where(opts).limit(params[:limit] || 20).offset(params[:offset].to_i)
    end

    def status
      @user = User.find(params[:id])
      @user.update_attributes!(params.require(:user).permit(:status))
    end
  end
end