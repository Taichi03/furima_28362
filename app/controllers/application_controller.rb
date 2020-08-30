class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'test@ta' && password == '9673'
    end
  end
end
