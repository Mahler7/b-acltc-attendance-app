class Api::V1::AttendancesController < ApplicationController
  def index
    @lecture = Lecture.find_by(id: params[:lecture_id])
    @attendances = @lecture.attendances
  end

  def create
    @lecture = Lecture.find_by(id: params[:lecture_id])
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      render :show
    else
      render json: {errors: @attendance.errors.messages}, status: 422 
    end
  end

  def show
    @lecture = Lecture.find_by(id: params[:lecture_id])
    @attendance = Attendance.find_by(id: params[:id])
  end

  private

    def attendance_params
      params.require(:attendance).permit(
        :attended,
        :lecture_id,
        :student_id
      )
    end
end
