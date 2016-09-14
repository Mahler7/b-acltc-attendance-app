class Attendance < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student

  def lecture_attendance
    if created_at > lecture.end_time
      "Student didn't attend lecture"
    elsif created_at > lecture.start_time && created_at < lecture.end_time
      "Student was late to class"
    else created_at < lecture.start_time
      "Student was at class on time"
    end
  end

  def display_time
    created_at.strftime("%D %I:%M %p")
  end
end
