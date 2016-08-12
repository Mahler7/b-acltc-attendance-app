class Teacher < ActiveRecord::Base
  has_secure_password

  def friendly_name
    "#{first_name.titleize} #{last_name.titleize}"
  end
end
