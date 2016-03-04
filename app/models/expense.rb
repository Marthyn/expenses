class Expense < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :shop

  after_create :update_counters

  validates :category, presence: true
  validates :user, presence: true
  validates :shop, presence: true

  def update_counters
    category.expenses_counter.increment!
    shop.expenses_counter.increment!
  end
end
