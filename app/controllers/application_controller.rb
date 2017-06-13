class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  attr_reader :current_user
  respond_to :json

  protected
  def set_current_user
    @current_user = User.find(auth_token[:id])
  end

  private
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JWTWrapper.decode(http_token)
  end
end
