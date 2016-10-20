class Shop < ApplicationRecord
  has_many :expenses

  scope :with_expenses, -> (timerange) {
    joins(:expenses).
    select("shops.id, shops.name").
    group("shops.id").
    where(expenses: { date: timerange }).
    having('count(expenses.id) > 0').
    order('sum(expenses.amount) DESC')
  }

  scope :by_usage, -> { order('expenses_count DESC') }

  def increment_expenses_count
    increment!(:expenses_count)
  end
end
