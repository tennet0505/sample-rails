class AuthService
    def self.generate_token
      payload = { api_key: 'dop_v1_28acd1169ddd5b84fe7eb60cf158e25b573246274251103fb5308a7c9dbfc892' }
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  
    def self.verify_token(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    rescue JWT::DecodeError
      nil
    end
end