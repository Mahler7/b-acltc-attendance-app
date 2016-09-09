class Student < ActiveRecord::Base
  has_secure_password
  belongs_to :cohort

  has_many :attendances
  has_many :lectures, through: :attendances
  # has_many :lectures, through: :cohort

  def friendly_name
    "#{first_name.titleize} #{last_name.titleize}"
  end
  
end
