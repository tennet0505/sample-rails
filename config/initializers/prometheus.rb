require 'prometheus/client'

module Prometheus
  module Controller
    prometheus = Prometheus::Client.registry
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