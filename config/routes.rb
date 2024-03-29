Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/rails/info/properties' , to: "rails/info#properties"
  get '/rails/info/routes'     , to: "rails/info#routes"
  get '/rails/info'            , to: "rails/info#index"
  get '/'                      , to: "rails/welcome#index"
  get '/log_test/log_messages'
  get '/test_gauge', to: 'test#gauge'
  get '/metrics_v2', to: 'metrics#metrics'
end
