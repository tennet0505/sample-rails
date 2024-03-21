if ENV['PYROSCOPE_PROFILES'] == 'enabled'
    require 'pyroscope'
    require 'pyroscope/otel'

    if ENV['IS_PRODUCTION_CRED'] == 'true' 
        Pyroscope.configure do |config|
            config.application_name = "sample-rails"
            config.server_address = "https://profiles-prod-001.grafana.net"
            config.basic_auth_username = '786746'
            config.basic_auth_password = 'glc_eyJvIjoiOTg3NzQ5IiwibiI6InB5cm9zY29wZXRva2VuLXB5cm9zY29wZV90b2tlbl93cml0ZSIsImsiOiIzREVzNTJGMzVSVXVTNjJpdDBLOVVLczciLCJtIjp7InIiOiJwcm9kLXVzLWVhc3QtMCJ9fQ=='
        end  
    else 
        Pyroscope.configure do |config|
            config.application_name = "sample-rails"
            config.server_address = "https://profiles-prod-001.grafana.net"
            config.basic_auth_username = '794348'
            config.basic_auth_password = 'glc_eyJvIjoiOTk0MjI2IiwibiI6InB5cm9zY29wZXRva2VuLXB5cm9zY29wZXRva2VuMnRlc3QiLCJrIjoiZ3U3OWVESTA3Nlk4ZTM1OWZ2bEEwYnFqIiwibSI6eyJyIjoidXMifX0='
        end
    end

    OpenTelemetry::SDK.configure do |c|
        c.service_name = app_name
        c.add_span_processor Pyroscope::Otel::SpanProcessor.new("#{app_name}.cpu", pyroscope_server_address)
        c.add_span_processor OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
          OpenTelemetry::Exporter::Jaeger::CollectorExporter.new(endpoint: jaeger_endpoint))
        c.use_all()
    end
end