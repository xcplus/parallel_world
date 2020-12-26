module V1
  class NodesController < BaseController
    before_action :set_brand
    def index
      @nodes = @brand.nodes.offset(params[:offset].to_i).limit(params[:limit].to_i || 20)
    end

    private
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end
  end
end