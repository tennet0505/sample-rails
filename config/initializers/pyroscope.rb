require 'pyroscope'
    
Pyroscope.configure do |config|
    config.application_name = "sample-rails"
    config.server_address = "https://profiles-prod-001.grafana.net"
    config.basic_auth_username = "786746"
    config.basic_auth_password = "glc_eyJvIjoiOTg3NzQ5IiwibiI6InB5cm9zY29wZXRva2VuLXB5cm9zY29wZXRva2Vud3JpdGVyZWFkIiwiayI6ImxDQTI0NGxORjFRclMxRzVBODhLNjJsUiIsIm0iOnsiciI6InByb2QtdXMtZWFzdC0wIn19"
end