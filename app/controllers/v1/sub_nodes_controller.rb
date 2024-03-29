module V1 
  class SubNodesController < BaseController
    before_action :set_node

    def index
      @sub_nodes = @node.sub_nodes.includes(:codes).offset(params[:offset].to_i).limit(params[:limit].to_i || 20)
    end

    private

    def set_node
      @node = Node.find(params[:node_id])
    end

  end
end