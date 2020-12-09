json.ret 1
json.data do
  json.ent do
    json.partial! 'admin/brands/brand', brand: @brand
  end
end