class Api::V1::AttendancesController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @lecture = Lecture.find_by(id: params[:lecture_id])
    @attendances = @lecture.attendances
  end

  def create
    @lecture = Lecture.find_by(id: params[:lecture_id])
    @attendance = Attendance.new(attendance_params)
    
    if @attendance.save
      @attendance.update(arrived: @attendance.created_at)
      render :show
    else
      render json: {errors: @attendance.errors.messages}, status: 422 
    end
  end

  def show
    @lecture = Lecture.find_by(id: params[:lecture_id])
    @attendance = Attendance.find_by(id: params[:id])
  end

  def update
    @attendance = Attendance.find_by(id: params[:id])
    
    if @attendance.update(attendance_params)
      # @attendance.update(arrived: @attendance.created_at)
      render :show
    else
      render json: {errors: @attendance.errors.messages}, status: 422 
    end

  end

  def destroy
    @attendance = Attendance.find_by(id: params[:id])
    # @lecture_id = Attendance.find_by(id: params[:lecture_id])
    @attendance.destroy

    render json: { message: "Attendance deleted" }
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
