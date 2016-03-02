class Expense < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :shop

  validates :category, presence: true
  validates :user, presence: true
  validates :shop, presence: true
end
