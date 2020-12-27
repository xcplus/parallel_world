json.extract! car, :id, :msrp, :particular_year, :sell_price, :freight, :open_fee, :oversea_fee, :cid, :code_options, :status, :created_at, :updated_at
json.brand do
  json.id car.brand_id
  json.name car.brand&.name
  json.english_name car.brand&.english_name
  json.status car.brand&.status
end
json.node do
  json.id car.node_id
  json.name car.node&.name
  json.english_name car.node&.english_name
  json.status car.node&.status
end
json.sub_node do
  json.id car.sub_node_id
  json.name car.sub_node&.name
  json.english_name car.sub_node&.english_name
  json.status car.sub_node&.status
  json.price car.sub_node&.price
end
json.codes do
  if !car.codes.blank?
    json.array! car.codes, partial: 'admin/codes/code', as: :code
  else
    []
  end
end 