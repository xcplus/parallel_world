module Admin
  class SubNodesController < BaseController
    before_action :set_node
    before_action :set_sub_node, only: [:show, :update, :destroy]

    def index
      @sub_nodes = @node.sub_nodes.offset(params[:offset].to_i).limit(params[:limit].to_i || 20)
    end

    def create
      @sub_node = @node.sub_nodes.create!(sub_node_params)
    end

    def show
      
    end

    def update
      @sub_node.update_attributes!(sub_node_params)
    end

    def destroy
      @sub_node.destroy
    end

    private

    def set_node
      @node = Node.find(params[:node_id])
    end

    def set_sub_node
      @sub_node = @node.sub_nodes.find(params[:id])
    end

    def sub_node_params
      params.require(:sub_node).permit(:english_name, :name, :status, :price)
    end
  end
end