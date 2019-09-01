class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  rescue_from UnAuthorizedError do |e|
    head :unauthorized
  end

  protected

  def authenticate_user!
    raise UnAuthorizedError unless current_user
  end

  def current_user
    begin
      @current_user ||= authenticate_or_request_with_http_token do |token, _|
        token_info = Authentication::JsonWebToken.decode(token)
        User.find_by(id: token_info[:user_id][:$oid])
      end
    rescue JWT::DecodeError
      raise UnAuthorizedError
    end
  end

end
