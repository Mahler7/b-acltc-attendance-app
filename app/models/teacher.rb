class Teacher < ActiveRecord::Base
  has_secure_password

  has_many :cohorts
  has_many :students, through: :cohorts
  has_many :lectures, through: :cohorts

  validates :first_name, :last_name, :phone, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def friendly_name
    "#{first_name.titleize} #{last_name.titleize}"
  end
end
