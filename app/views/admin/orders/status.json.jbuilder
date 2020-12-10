json.ret 1
json.data do
  json.ent do
    json.partial! 'admin/orders/order', order: @order
  end
end