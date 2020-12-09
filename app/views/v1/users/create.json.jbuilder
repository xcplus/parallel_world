json.ret 1
json.data do
  json.ent do
    json.nickname @user.nickname
    json.avatar @user.avatar
    json.phone, @user.phone
    json.email @user.email
    json.company_name @user.company_name
    json.company_addr @user.company_addr
    json.company_qual @user.company_qual
    json.status @user.status
    json.username @user.username
    json.area @user.area
  end
end