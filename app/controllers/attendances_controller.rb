class AttendancesController < ApplicationController

  before_action :authenticate_teacher!
  around_action :set_timezone, only: [:show, :new, :create, :edit, :update]

  def new
    @attendance = Attendance.new
    @lecture = Lecture.find_by(id: params[:lecture_id])
  end

  def create
    @attendance = Attendance.new(attendance_params) unless @attendance
    @lecture = @attendance.lecture
   
    if @attendance.save
      flash[:success] = "Attendance saved"
      redirect_to "/lectures/#{@lecture.id}"
    else
      flash[:warning] = "Attendance wasn't saved"
      render :new
    end
  end

  def edit
    @attendance = Attendance.find_by(id: params[:id])
  end

  def update
    @attendance = Attendance.find_by(id: params[:id])
    @lecture_id = @attendance.lecture_id

    if @attendance.update(attendance_params)
      flash[:success] = "Attendance updated"
      redirect_to "/lectures/#{@lecture_id}"
    else
      flash[:warning] = "Attendance was not updated"
      render :edit
    end
  end

  private

    def attendance_params
      params.require(:attendance).permit(
        :arrived,
        :attended,
        :lecture_id,
        :student_id,
        :created_at,
        :display_time
      )
    end

    def set_timezone
      @lecture = Lecture.find_by(id: params[:lecture_id])
      old_timezone = Time.zone
      Time.zone = @lecture.cohort.timezone 
      yield
    ensure
      Time.zone = old_timezone
    end

end
