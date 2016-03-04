class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user_owner?

  before_action :load_schema

  def current_user_owner?
    current_account.owner == current_user
  end

  def current_account
    @current_account ||= current_user.organization
  end

  def load_schema
    Apartment::Tenant.switch("public")
    return if sign_up_or_sign_in

    if current_user
      Apartment::Tenant.switch(current_account.name)
    else
      redirect_to new_user_session_path(subdomain: false)
    end
  end

  def sign_up_or_sign_in
    params[:controller] == "devise/sessions" || params[:controller] == "users/registrations" || params[:controller] == "accounts"
  end
end
