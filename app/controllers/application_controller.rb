class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to :back
  end
end
