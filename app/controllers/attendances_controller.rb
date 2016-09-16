class AttendancesController < ApplicationController

  def new

  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @attendance = @lecture.attendances.new(attendance_params) unless @attendance

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

end
