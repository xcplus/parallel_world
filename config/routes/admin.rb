# 登录
post "login", to: "sessions#create"
post "logout", to: "sessions#destroy"

# 用户管理
resources :users, only: [:index] do
  member do
    # 更新状态
    post :status
  end
end

# 品牌管理
resources :brands, only: [:create, :update, :show, :destroy, :index]

# 车系管理
resources :nodes, only: [:create, :update, :show, :destroy, :index]

# 车分系管理
resources :sub_nodes, only: [:create, :update, :show, :destroy, :index]

# 车分系的配置项code管理
resources :codes, only: [:create, :update, :show, :destroy, :index]

# 车源管理
resources :cars, only: [:create, :show, :update, :destroy, :index]

# 角色管理
resources :roles, only: [:create, :show, :update, :destroy, :index]

# 后台用户管理
resources :admin_users, only: [:create, :show, :update, :destroy, :index]

# 订单管理
resources :orders, only: [:index] do
  member do
    put :status
  end
end