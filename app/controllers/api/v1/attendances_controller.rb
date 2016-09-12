class Api::V1::AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @attendance = @lecture.attendances.new(attendance_params)
    # student_find = @attendance.find(params[:student_id])
    # @attended_student = Student.find_by(id: params[student_find])
    if @attendance.save
      flash[:success] = "Attendance saved"
      render :show
    else
      render json: {message: "Attendance not saved"}
    end
  end


  def show
    @attendance = Attendance.find_by(id: params[:id])
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
