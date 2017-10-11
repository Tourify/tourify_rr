class ApplicationController < ActionController::Base
  # include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def current_user
    @_current_user ||= session [:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  # def authenticate
  #   authenticate_token || render_unauthorized
  # end
  #
  # def authenticate_token
  #   authenticate_with_http_token do |token, options|
  #     @admin = Admin.find_by(token: token)
  #   end
  # end
  #
  # def render_unauthorized
  #   self.headers['WWW-Authenticate'] = 'Token realm="Application"'
  #   render json: {error: 'Bad credentials'}, status: :unauthorized
  # end
  #
  # def current_user
  #   @admin
  # end

end
  # protect_from_forgery with: :exception
