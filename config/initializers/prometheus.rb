require_relative '../../app/services/auth_service'

module Prometheus
    module Controller
      def self.configure_with_token
        # Generate a token
        token = AuthService.generate_token
        puts "Generated token: #{token}"
  
        # Verify the token
        decoded_token = AuthService.verify_token(token)
        unless decoded_token
          raise StandardError.new("Unauthorized: Invalid token (#{token})")
        end
  
        puts "Decoded token: #{decoded_token}"
  
        # Configure Prometheus client with authentication headers
        Prometheus::Client.config do |config|
          auth_header = "Bearer #{token}"
          config.http do |http_config|
            http_config.headers['Authorization'] = auth_header
          end
        end
  
        # Register metrics
        prometheus = Prometheus::Client.registry
        gauge1 = Prometheus::Client::Gauge.new(:prometheus_metrics, docstring: 'Health check for Prometheus Metrics')
        prometheus.register(gauge1)
  
        # Other metric registrations...
        end
    end
end
  
  # Call the method to configure Prometheus with token authentication
  Prometheus::Controller.configure_with_token