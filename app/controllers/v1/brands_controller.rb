module V1
  class BrandsController < BaseController
    def index
      @brands = Brand.limit(params[:limit].to_i || 20).offset(params[:offset].to_i)
    end
  end
end