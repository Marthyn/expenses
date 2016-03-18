class Signup
  include ActiveModel::Model

  attr_accessor :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation,
    :account_name,
    :user,
    :account,
    :monthly_budget

  validate :validate_children

  def initialize(*)
    super
    build_children
  end

  def save
    if valid?
      ActiveRecord::Base.transaction do
        account.save!
        user.save!
        user.update_attribute(:organization_id, account.id)
      end
    end
  end

  private

  def build_children
    @user = User.new(first_name: first_name,
                     last_name: last_name,
                     email: email,
                     password: password,
                     password_confirmation: password_confirmation)
    @account = Account.new(name: account_name, owner: @user, monthly_budget: monthly_budget)
  end

  def validate_children
    if user.invalid?
      promote_errors(user)
    end

    if account.invalid?
      promote_errors(account)
    end
  end

  def promote_errors(child)
    child.errors.each do |attr, val|
      errors.add(attr, val)
    end
  end
end
