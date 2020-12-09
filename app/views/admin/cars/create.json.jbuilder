json.ret 1
json.data do
  json.ent do
    json.partial! 'admin/cars/car', car: @car
  end
end