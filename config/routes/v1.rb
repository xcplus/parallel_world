# 微信code获取用户信息(openid和session_key)
post :weixin, only: [:create]
# 同步用户信息
resources :users, only: [:create] do
  collection do
    # 获取用户微信手机号
    post :weixin_phone
  end
end

