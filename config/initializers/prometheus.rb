require 'prometheus/client'

module Prometheus
  module Controller
    prometheus = Prometheus::Client.registry
    gauge = Prometheus::Client::Gauge.new(:online_store, docstring:'Health check for Prometheus Metrics')
    prometheus.register(gauge)
  end
end