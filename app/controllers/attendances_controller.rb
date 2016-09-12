class AttendancesController < ApplicationController

  def new

  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @attendance = @lecture.attendances.new(attendance_params) unless @attendance
    # student_find = @attendance.find(params[:student_id])
    # @attended_student = Student.find_by(id: params[student_find])
    

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
        format.js
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
        format.js
      end
    end

  end

  private

    def attendance_params
      params.require(:attendance).permit(
        :arrived,
        :attended,
        :lecture_id,
        :student_id
      )
    end

end
