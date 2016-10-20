class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :shop

  after_create :update_counters

  validates :category, presence: true
  validates :user, presence: true
  validates :shop, presence: true

  def update_counters
    category.increment_expenses_count
    shop.increment_expenses_count
  end
end
