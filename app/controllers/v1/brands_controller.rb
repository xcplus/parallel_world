module V1
  class BrandsController < BaseController
    def index
      @brands = Brand.visible.limit(params[:limit] || 20).offset(params[:offset].to_i)
    end
  end
end