module Admin
  class OrdersController < BaseController
    def index
      @orders = Order.includes(:user, :car, :brand, :sub_node, :node).limit(params[:limit] || 20).offset(params[:offset].to_i)
    end

    def status
      @order = Order.find(params[:id])
      @order.update_attributes!(params.permit(:status))
    end
  end
end