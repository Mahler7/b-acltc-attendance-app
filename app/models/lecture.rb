class Lecture < ActiveRecord::Base
  belongs_to :cohort
  has_many :attendances
  # has_many :attended_students, through: :attendances, source: :student, class_name: "Student"
  has_many :students, through: :attendances
end
