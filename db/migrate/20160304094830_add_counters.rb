class AddCounters < ActiveRecord::Migration
  def change
    add_column :shops, :expenses_count, :integer, default: 0
    add_column :categories, :expenses_count, :integer, default: 0

    Account.pluck(:name).each do |a|
      Apartment::Tenant.switch(a)
      Shop.all.each do |c|
        c.update_attribute(:expenses_count, c.expenses.count)
      end
      Category.all.each do |c|
        c.update_attribute(:expenses_count, c.expenses.count)
      end
    end
  end
end
