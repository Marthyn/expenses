class Expense < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :shop

  def expenses_for_timeframe(range)

  end
end
