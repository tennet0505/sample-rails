require 'prometheus/client'
require 'net/http'

# Prometheus::Client.config do |config|
#     auth_token = 'dop_v1_28acd1169ddd5b84fe7eb60cf158e25b573246274251103fb5308a7c9dbfc892' 
#     config.http do |http_config|
#       http_config.headers['Authorization'] = auth_header
#     end
# end

module Prometheus
  module Controller

    def self.authenticate_with_token(token)
        # Implement your token authentication logic here
        # For example, you could validate the token against a database or external service
        # For simplicity, let's assume AuthService.verify_token(token) returns true if the token is valid
        unless AuthService.verify_token(token)
          raise StandardError.new('Unauthorized: Invalid token')
        end
      end

    prometheus = Prometheus::Client.registry

    token = 'dop_v1_28acd1169ddd5b84fe7eb60cf158e25b573246274251103fb5308a7c9dbfc892'

    # Authenticate with the obtained token
    authenticate_with_token(token)

    gauge1 = Prometheus::Client::Gauge.new(:prometheus_metrics, docstring:'Health check for Prometheus Metrics')
    prometheus.register(gauge1)

    gauge = Prometheus::Client::Gauge.new(:room_temperature_celsius, docstring: '...', labels: [:room])
    gauge.set(21.534, labels: { room: 'kitchen' })
    gauge.get(labels: { room: 'kitchen' })
    gauge.increment(labels: { room: 'kitchen' })
    gauge.decrement(by: 5, labels: { room: 'kitchen' })

    counter = Prometheus::Client::Counter.new(:service_requests_total, docstring: '...', labels: [:service])
    counter.increment(labels: { service: 'foo' })
    counter.increment(by: 5, labels: { service: 'bar' })
    counter.get(labels: { service: 'bar' })

    prometheus.register(gauge)
    prometheus.register(counter)
  end
end