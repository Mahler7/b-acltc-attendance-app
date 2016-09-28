class Lecture < ActiveRecord::Base
  belongs_to :cohort
  has_many :attendances
  has_many :students, through: :attendances

  validates :name, :start_time, :end_time, :cohort_id, presence: true
  after_create :create_student_attendances

  def friendly_start_time 
    start_time.utc.strftime("%D %I:%M %p")
  end

  def friendly_end_time 
    end_time.utc.strftime("%D %I:%M %p")
  end

  def create_student_attendances
    cohort.students.each do |student|
      Attendance.create(lecture_id: id, student_id: student.id)
    end
  end
end
