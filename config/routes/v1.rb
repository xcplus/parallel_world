# 微信code获取用户信息(openid和session_key)
resources :weixin, only: [:create]
# 同步用户信息
resources :users, only: [:create] do
  collection do
    # 获取用户微信手机号
    post :weixin_phone
  end
end
# 车源列表以及搜索
resources :cars, only: [:create]
# 品牌
resources :brands, only: [:index]
# 车系
resources :nodes, only: [:index]
# 分车系
resources :sub_nodes, only: [:index]
# 配置项
resources :codes, only: [:index]
# 获取个人信息
post :me, to: "users#me"
# 订单管理
resources :orders, only: [:index, :create] do
  member do
    put :status
  end
end

