module Admin
  class OrdersController < BaseController
    def index
      sql_content = nil
      sql_content = ["users.nickname like :keyword or users.phone like :keyword", {keyword: "%#{params[:keyword].strip}%"}] if params[:keyword].present?
      @orders = Order.includes(:user, :car, :brand, :sub_node, :node).where(sql_content).by_time(params[:start_time], params[:end_time]).references(:users).limit(params[:limit] || 20).offset(params[:offset].to_i)
    end

    def status
      @order = Order.find(params[:id])
      @order.update_attributes!(params.permit(:status))
    end
  end
end