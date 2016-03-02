class AddShopIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :shop_id, :integer
  end
end
