if ENV['PYROSCOPE_PROFILES'] == 'enabled'
    require 'pyroscope'
        
    if ENV['IS_PRODUCTION_CRED'] == 'true' 
        Pyroscope.configure do |config|
            config.application_name = "sample-rails"
            config.server_address = "https://profiles-prod-001.grafana.net"
            config.basic_auth_username = '794348'
            config.basic_auth_password = 'glc_eyJvIjoiOTk0MjI2IiwibiI6InB5cm9zY29wZXRva2VuLXB5cm9zY29wZXRva2VuMnRlc3QiLCJrIjoiZ3U3OWVESTA3Nlk4ZTM1OWZ2bEEwYnFqIiwibSI6eyJyIjoidXMifX0='
        end
    else 
        Pyroscope.configure do |config|
            config.application_name = "sample-rails"
            config.server_address = "https://profiles-prod-001.grafana.net"
            config.basic_auth_username = '786746'
            config.basic_auth_password = 'glc_eyJvIjoiOTg3NzQ5IiwibiI6InB5cm9zY29wZXRva2VuLXB5cm9zY29wZV90b2tlbl93cml0ZSIsImsiOiIzREVzNTJGMzVSVXVTNjJpdDBLOVVLczciLCJtIjp7InIiOiJwcm9kLXVzLWVhc3QtMCJ9fQ=='
        end  
    end
end