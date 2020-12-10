json.ret 1
json.data do
  json.ent do
    json.partial! 'admin/admin_users/admin_user', admin_user: @admin_user
  end
end