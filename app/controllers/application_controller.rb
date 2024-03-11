class ApplicationController < ActionController::Base
    before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    render json: { error: 'Unauthorized' }, status: :unauthorized unless AuthService.verify_token(token)
  end
end
