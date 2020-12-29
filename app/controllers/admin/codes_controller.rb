module Admin
  class CodesController < BaseController
    before_action :set_sub_node
    before_action :set_code, only: [:show, :update, :destroy]

    def index
      opts = []
      if params[:name].present?
        opts[0] = "codes.name like ?"
        opts[1] = "%#{params[:name].strip}%"
      end
      if params[:cid].present?
        opts[0] = opts[0].to_s + " OR codes.cid like ?"
        opts.push("%#{params[:cid].strip}%")
      end
      @codes = @sub_node.codes.where(opts).offset(params[:offset].to_i).limit(params[:limit].to_i || 20)
    end

    def create
      @code = @sub_node.codes.create!(code_params)
    end

    def show
    end

    def update
      @code.update_attributes!(code_params)
    end

    def destroy
      @code.destroy
    end

    private

    def set_sub_node
      @sub_node = SubNode.find(params[:sub_node_id])
    end

    def set_code
      @code = @sub_node.codes.find(params[:id])
    end

    def code_params
      params.require(:code).permit(:cid, :name, :status, :price, :style)
    end
  end
end