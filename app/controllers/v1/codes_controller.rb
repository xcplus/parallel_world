module V1
  class CodesController < BaseController
    # brand_id
    # node_id
    # sub_node_id
    # car_id
    # style
    def index
      options = {}
      options.merge!({brand_id: params[:brand_id]}) if params[:brand_id].present?
      options.merge!({node_id: params[:node_id]}) if params[:node_id].present?
      options.merge!({sub_node_id: params[:sub_node_id]}) if params[:sub_node_id].present?
      options.merge!({car_id: params[:car_id]}) if params[:car_id].present?
      options.merge!({style: params[:style]})
      @codes = Code.where(options).visible.offset(params[:offset].to_i).limit(params[:limit] || 20)
    end
  end
end