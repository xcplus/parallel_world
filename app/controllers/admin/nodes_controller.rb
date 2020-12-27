module Admin
  class NodesController < BaseController
    before_action :set_brand, only: [:index, :create]
    before_action :set_node, only: [:show, :update, :destroy]

    def index
      @nodes = @brand.nodes.offset(params[:offset].to_i).limit(params[:limit].to_i || 20)
    end

    def create
      @node = @brand.nodes.create!(node_params)
    end

    def show
    end

    def update
      @node.update_attributes!(node_params)
    end

    def destroy
      @node.destroy
    end

    private

    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    def set_node
      @node = Node.find(params[:id])
    end

    def node_params
      params.require(:node).permit(:english_name, :name, :status)
    end
  end
end