class Teacher < ActiveRecord::Base
  has_secure_password

  has_many :cohorts

  def friendly_name
    "#{first_name.titleize} #{last_name.titleize}"
  end
end
