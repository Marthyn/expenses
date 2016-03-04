class AddCounters < ActiveRecord::Migration
  def change
    add_column :shops, :expenses_count, :integer, default: 0
    add_column :categories, :expenses_count, :integer, default: 0
  end
end
