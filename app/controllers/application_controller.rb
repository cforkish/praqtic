class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  # Enforce authorization with CanCan
  check_authorization

  # Handle Unauthorized Access with CanCan
  # See: https://github.com/ryanb/cancan/blob/master/README.rdoc
  rescue_from CanCan::AccessDenied do |exception|
    if signed_in?
      redirect_to root_url
    else
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  # Workaround for CanCan with Rails 4
  # See: https://github.com/ryanb/cancan/issues/835#issuecomment-18663815
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
end
