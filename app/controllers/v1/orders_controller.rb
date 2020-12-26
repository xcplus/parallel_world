module V1
  class OrdersController < BaseController
    def index
      @orders = current_user.orders.includes(:user, :car, :brand, :sub_node, :node).order("created_at desc").limit(params[:limit].to_i || 20).offset(params[:offset].to_i)
    end

    def create
      @order = current_user.create!(params.permit(:car_id))
    end

    def status
      @order = current_user.orders.find(params[:id])
      @order.update_attributes!(params.permit(:status))
    end
  end
end