Rails.application.routes.draw do

  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  resources :uploads, only: [:create]

  namespace :v1, defaults: {format: :json} do
    draw :v1
  end

  namespace :admin, defaults: {format: :json} do
    draw :admin
  end
end
