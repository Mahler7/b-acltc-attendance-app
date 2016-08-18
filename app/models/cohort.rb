class Cohort < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
  has_many :lectures
end
