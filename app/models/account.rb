# == Schema Information
#
# Table name: public.accounts
#
#  id         :integer          not null, primary key
#  subdomain  :string           default(""), not null
#  owner_id   :integer          default("0"), not null
#  created_at :datetime
#  updated_at :datetime
#

class Account < ApplicationRecord
  validates :owner, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :owner, class_name: "User"

  has_many :users, inverse_of: :organization

  private

  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
end
