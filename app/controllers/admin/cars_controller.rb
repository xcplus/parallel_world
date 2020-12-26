module Admin
  class CarsController < BaseController
    before_action :set_sub_node, except: [:index, :show]
    before_action :set_car, only: [:update, :destroy]

    def index
      cal = {}
      cal.merge!({brand_id: params[:brand_id]}) if params[:brand_id].present?
      cal.merge!({node_id: params[:node_id]}) if params[:node_id].present?
      cal.merge!({sub_node_id: params[:sub_node_id]}) if params[:sub_node_id].present?
      @cars = Car.visible_car.where(cal).offset(params[:offset].to_i).limit(params[:limit].to_i || 20)
    end

    def create
      @car = @sub_node.cars.create!(car_params)
    end

    def show
      @car = Car.find(params[:id])
    end

    def update
      @car.update_attributes!(car_params)
    end

    def destroy
      @car.destroy
    end

    private

    def set_sub_node
      @sub_node = SubNode.find(params[:sub_node_id])
    end

    def set_car
      @car = @sub_node.cars.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:msrp, :particular_year, :sell_price, :freight, :open_fee, :cid, :status, :oversea_fee, code_options: [])
    end
  end
end