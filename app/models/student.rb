class Student < ActiveRecord::Base
  has_secure_password
  belongs_to :cohort
  has_many :attendances
  has_many :lectures, through: :attendances

  validates :first_name, :last_name, :phone, :email, :cohort_id, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def friendly_name
    "#{first_name.titleize} #{last_name.titleize}"
  end
  
end
