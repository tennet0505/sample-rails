class MetricsController < ApplicationController
    before_action :authenticate
    
    def metrics
      render plain: Prometheus::Client::Formats::Text.marshal(Prometheus::Client.registry)
    end
    
    private
    
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == '1281393' && password == 'glc_eyJvIjoiOTg3NzQ5IiwibiI6Im1ldHJpY3NfZW5kcG9pbnRfdG9rZW4tcHJvbWV0aGV1c3Rva2VuIiwiayI6IkJ6MmY3Y282WWU0TjJBSDZHVzUxNVcwZyIsIm0iOnsiciI6InByb2QtdXMtZWFzdC0wIn19'
      end
    end
  end