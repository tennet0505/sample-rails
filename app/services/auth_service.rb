class AuthService
    def self.generate_token
      payload = { api_key: ENV['DIGITAL_OCEAN_TOKEN'] }
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  
    def self.verify_token(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    rescue JWT::DecodeError
      nil
    end
  end