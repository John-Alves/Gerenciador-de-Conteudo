class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def authenticate_user
    unless logged_in?
      redirect_to sessions_new_path
    end
  end
end
