class Attendance < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student

  def lecture_attendance
    if created_at.in_time_zone(lecture.cohort.timezone).iso8601 > lecture.end_time.utc.iso8601
      "Student didn't attend lecture"
    elsif created_at.in_time_zone(lecture.cohort.timezone).iso8601 > lecture.start_time.utc.iso8601 && created_at.in_time_zone(lecture.cohort.timezone).iso8601 < lecture.end_time.utc.iso8601
      "Student was late to class"
    else created_at.in_time_zone(lecture.cohort.timezone).iso8601 < lecture.start_time.utc.iso8601
      "Student was at class on time"
    end
  end

  def display_time
    created_at.in_time_zone(lecture.cohort.timezone).strftime("%D %I:%M %p")
  end
end
