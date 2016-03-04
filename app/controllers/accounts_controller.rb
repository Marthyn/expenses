
class AccountsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :authorize!, only: [:edit, :destroy]

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)
    if @signup.valid?
      Apartment::Tenant.create(@signup.account_name)
      Apartment::Tenant.switch(@signup.account_name)
      @signup.save
      redirect_to new_user_session_path
    else
      render action: "new"
    end
  end

  def edit
    # @current_account = request.host
  end

  def destroy
    current_account.destroy
    Apartment::Tenant.drop(current_account_name)
  end

  private

  def signup_params
    params.require(:signup)
          .permit(:account_name, :first_name, :last_name, :email,
                    :password, :password_confirmation)
  end

  def authorize!
    raise ActiveRecord::RecordNotFound unless current_user_owner?
  end
end
