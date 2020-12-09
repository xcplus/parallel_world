json.ret 1
json.data do
  json.ent do
    json.partial! 'admin/users/user', user: @user
  end
end