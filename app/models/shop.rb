class Shop < ActiveRecord::Base
  has_many :expenses

  def expenses_for_timeframe(range)

  end
end
