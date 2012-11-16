class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_api, :if => :json?

private

  def json?
    request.format.json? && !current_user
  end

  def authenticate_api
    authenticate_or_request_with_http_token do |token, options|
      if User.exists?(:authentication_token => token)
        params[:auth_token] = token
      end
    end
  end
end
