json.ret 1
json.data do
  json.ent do
    json.partial! 'v1/cars/car', car: @car
  end
end