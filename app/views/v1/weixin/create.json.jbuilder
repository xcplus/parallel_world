json.ret @user.persisted? ? 1 : -1
json.msg "请求微信失败" if !@user.persisted?
json.data do
  json.ent @user.session_key:
end