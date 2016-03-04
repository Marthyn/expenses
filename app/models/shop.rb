class Shop < ActiveRecord::Base
  has_many :expenses, counter_cache: true

  scope :with_expenses, -> (timerange) {
    joins(:expenses).
    select("shops.id, shops.name").
    group("shops.id").
    where(expenses: { date: timerange }).
    having('count(expenses.id) > 0').
    order('sum(expenses.amount) DESC')
  }

  scope :by_usage, -> { order('expenses_count DESC') }
end
