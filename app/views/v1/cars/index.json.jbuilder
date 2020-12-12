json.ret 1
json.data do
  json.ent do
    total_count = @cars.total_count
    json.offset params[:offset].to_i
    json.total total_count
    json.more (params[:offset].to_i + (params[:limit] || 20).to_i) < total_count
    json.items do
      json.array! @cars, partial: 'admin/cars/car', as: :car
    end
  end
end