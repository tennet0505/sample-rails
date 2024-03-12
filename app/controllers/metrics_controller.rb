class MetricsController < ApplicationController
    before_action :authenticate
    
    def metrics
      render plain: Prometheus::Client::Formats::Text.marshal(Prometheus::Client.registry)
    end
    
    private
    
    def authenticate
        authenticate_or_request_with_http_basic do |username, password|
        username == 'user_name' && password == 'password'
    end
  end
end