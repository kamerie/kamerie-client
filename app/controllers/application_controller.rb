class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, except: [:globals]

  def home; end

  def globals
    render "globals", format: :js, layout: nil
  end

  def default_serializer_options
    {root: false}
  end
end