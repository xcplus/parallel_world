json.ret 1
json.data do
  json.ent do
    json.nickname current_user.nickname
    json.avatar current_user.avatar
    json.phone current_user.phone
    json.email current_user.email
    json.company_name current_user.company_name
    json.company_addr current_user.company_addr
    json.company_qual current_user.company_qual
    json.status current_user.status
    json.username current_user.username
    json.area current_user.area
  end
end