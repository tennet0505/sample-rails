require 'pyroscope'
    
Pyroscope.configure do |config|
    config.application_name = 'lobster-app-vt93u.ondigitalocean.app'
    config.server_address = 'https://profiles-prod-001.grafana.net'
    config.basic_auth_username = '786746'
    config.basic_auth_password = 'glc_eyJvIjoiOTg3NzQ5IiwibiI6InN0YWNrLTc4Njc0Ni1ocC1yZWFkLXB5cmlzY29wZV90b2tlbl9uZXciLCJrIjoiZDY4OXlSNE15ODl3UHY5UTh4YzVwOFBxIiwibSI6eyJyIjoicHJvZC11cy1lYXN0LTAifX0='
end