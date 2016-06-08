class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

 # Make the current_user method available to views, not just controllers!
helper_method :current_user, :followed?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def followed?(poster)
    if poster.followers.include? current_user
      return true
    else
      return false
    end
  end
end
