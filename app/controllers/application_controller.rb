class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def home; end

  def globals
    @omniauth = {
      reddit: user_omniauth_authorize_path(:reddit)
    }
    render 'globals', format: :js, layout: nil
  end
end
