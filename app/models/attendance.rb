class Attendance < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student

  def lecture_attendance
    
    if arrived.in_time_zone(lecture.cohort.timezone).iso8601 > lecture.end_time.utc.iso8601
      "Student didn't attend class"
    elsif arrived.in_time_zone(lecture.cohort.timezone).iso8601 > lecture.start_time.utc.iso8601 && arrived.in_time_zone(lecture.cohort.timezone).iso8601 < lecture.end_time.utc.iso8601
      "Student was late to class"
    else arrived.in_time_zone(lecture.cohort.timezone).iso8601 < lecture.start_time.utc.iso8601
      "Student was at class on time"
    end
  end

  def display_time
    arrived.in_time_zone(lecture.cohort.timezone).strftime("%D %I:%M %p")
  end
end
