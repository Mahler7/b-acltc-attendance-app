json.id attendance.id
json.arrived attendance.arrived
json.attended attendance.attended
json.lecture_id attendance.lecture_id
json.student_id attendance.student_id
json.created_at attendance.created_at
json.arrived attendance.arrived

if attendance.student
  json.student_name attendance.student.friendly_name
end
if attendance.arrived.present?
  json.lecture_attendance attendance.lecture_attendance
  json.display_time attendance.display_time
end