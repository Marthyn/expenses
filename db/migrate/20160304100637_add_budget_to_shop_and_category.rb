class AddBudgetToShopAndCategory < ActiveRecord::Migration
  def change
    add_column :shops, :monthly_budget, :float, default: nil
    add_column :categories, :monthly_budget, :float, default: nil
  end
end
