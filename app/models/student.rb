class Student < ActiveRecord::Base
  has_secure_password
  belongs_to :cohort

  def friendly_name
    "#{first_name.titleize} #{last_name.titleize}"
  end
  
end
