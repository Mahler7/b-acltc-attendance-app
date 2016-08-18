class Teacher < ActiveRecord::Base
  has_secure_password

  has_many :cohorts
  has_many :students, through: :cohorts
  has_many :lectures, through: :cohorts

  def friendly_name
    "#{first_name.titleize} #{last_name.titleize}"
  end
end
