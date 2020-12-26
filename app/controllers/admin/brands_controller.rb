module Admin
  class BrandsController < BaseController
    before_action :set_brand, only: [:show, :update, :destroy]
    def index
      sql_content = nil
      sql_content = ["name like :name or english_name like :name", {name: "%#{params[:name].strip}%"}] if params[:name].present?
      @brands = Brand.where(sql_content).limit(params[:limit].to_i || 20).offset(params[:offset].to_i)
    end

    def create
      @brand = Brand.create!(brand_params)
    end

    def show
    end

    def update
      @brand.update_attributes!(brand_params)
    end

    def destroy
      @brand.destroy
    end

    private

    def brand_params
      params.require(:brand).permit(:name, :english_name, :status)
    end

    def set_brand
      @brand = Brand.find(params[:id])
    end
  end
end