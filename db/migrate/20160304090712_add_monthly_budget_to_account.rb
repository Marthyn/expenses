class AddMonthlyBudgetToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :monthly_budget, :float, default: 400
  end
end
