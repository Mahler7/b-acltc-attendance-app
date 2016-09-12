class Lecture < ActiveRecord::Base
  belongs_to :cohort
  has_many :attendances
  has_many :students, through: :attendances
end
