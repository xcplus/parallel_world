json.extract! car, :msrp, :particular_year, :sell_price, :freight, :open_fee, :oversea_fee, :cid, :code_options, :status
json.brand do
  json.name car.brand.name
  json.english_name car.brand.english_name
  json.status car.brand.status
end
json.node do
  json.name car.node.name
  json.english_name car.node.english_name
  json.status car.node.status
end
json.sub_node do
  json.name car.sub_node.name
  json.english_name car.sub_node.english_name
  json.status car.sub_node.status
end
json.codes do
  if car.codes.present?
    json.array! car.codes, partial: 'admin/codes/code', as: :code
  else
    []
  end
end 