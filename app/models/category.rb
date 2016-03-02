class Category < ActiveRecord::Base
  has_many :expenses

  scope :with_expenses, -> (timerange) {
    joins(:expenses).
    select("categories.id, categories.name").
    group("categories.id").
    where(expenses: { date: timerange }).
    having('count(expenses.id) > 0').
    order('sum(expenses.amount) DESC')
  }

  def expenses_for_timeframe(range)

  end
end
