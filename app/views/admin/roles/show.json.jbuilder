json.ret 1
json.data do
  json.ent do
    json.partial! 'admin/roles/role', role: @role
  end
end