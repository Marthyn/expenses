class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization, class_name: "Account", inverse_of: :users
  has_many :expenses

  def full_name
    "#{first_name} #{last_name}"
  end

  def color
    full_name.pastel_color
  end
end
