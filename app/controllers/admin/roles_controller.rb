module Admin
  class RolesController < BaseController
    def index
      @roles = Role.offset(params[:offset].to_i).limit(params[:limit] || 20)
    end

    def create
      @role = Role.create!(params.require(:role).permit(:name, :cid))
    end

    def show
      @role = Role.find(params[:id])
    end

    def update
      @role = Role.find(params[:id])
      @role.update_attributes!(params.require(:role).permit(:name, :cid))
    end

    def destroy
      @role = Role.find(params[:id])
      @role.destroy!
    end
  end
end