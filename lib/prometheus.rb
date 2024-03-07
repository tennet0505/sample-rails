module Prometheus
    module Controller
  
        prometheus = Prometheus::Client.registry
        GAUGE_EXAMPLE = Prometheus::Client::Gauge.new(:gauge_example, 'A simple gauge.')
        prometheus.register(GAUGE_EXAMPLE)
  
    end
  end