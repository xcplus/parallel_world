module V1
  class CarsController < BaseController
=begin
  params:
  {
    brand_id:
    node_id:
    sub_node_id:
    particular_year:
    msrp:
    sort:{
      msrp: :desc | :asc
      particular_year: :desc | :asc
    }
    code_options: {
      "外观颜色": "黄色"
    }
  }
=end
    def create
      options = {status: "online"}
      cal = {}
      sort = {}
      
      cal.merge!({id: params[:car_id]}) if params[:car_id].present?
      cal.merge!({brand_id: params[:brand_id]}) if params[:brand_id].present?
      cal.merge!({node_id: params[:node_id]}) if params[:node_id].present?
      cal.merge!({sub_node_id: params[:sub_node_id]}) if params[:sub_node_id].present?
      options.merge!(cal) if !cal.blank?
      options.merge!({particular_year: params[:particular_year]}) if params[:particular_year].present?
      options.merge!({msrp: params[:msrp]}) if params[:msrp].present?
      sort.merge!({msrp: params[:sort][:msrp].to_sym}) if params[:sort] && %w{desc asc}.include?(params[:sort][:msrp])
      sort.merge!({particular_year: params[:sort][:particular_year]}) if params[:sort] && %w{desc asc}.include?(params[:sort][:particular_year])
      if params[:code_options].present?
        arr = []
        params[:code_options].each do |key, value|
          ["style = ? and name = ?", key, value]
          if arr[0].blank?
            arr[0] = "style = ? and name = ?"
          else 
            arr[0] += " OR style = ? and name = ?"
          end
          arr.push(key)
          arr.push(value)
        end
        @code_ids = Code.where(cal).where(arr).pluck(:cid)
      end
      @cars = Car.visible_car.where.not(status: "offline")
      @cars = @cars.where(options) if !options.blank?
      @cars = @cars.order(sort) if !sort.blank?
      @cars = @cars.where("code_options @> ARRAY[?]::varchar[]", @code_ids) if @code_ids.present?
      if params[:limit].blank?
        params[:limit] = 20
      end
      @cars = @cars.offset(params[:offset].to_i).limit(params[:limit].to_i)
    end


    def show
      @car = Car.includes(:brand, :node, :sub_node).find(params[:id])
    end
  end
end