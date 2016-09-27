class LecturesController < ApplicationController
  
  before_action :authenticate_teacher!
  around_action :set_timezone, only: [:show]
  
  def new
    @lecture = Lecture.new
    @cohort = Cohort.find_by(id: params[:id])
  end

  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      flash[:success] = "Successfully created new lecture"
      redirect_to "/cohorts/#{@lecture.cohort_id}"
    else
      flash[:warning] = "Lecture Not Created"
      render :new
    end
  end

  def show
    @lecture = Lecture.find_by(id: params[:id])
    @current_student_id = current_student.id if current_student
  end

  def edit
    @lecture = Lecture.find_by(id: params[:id])
  end

  def update
    @lecture = Lecture.find_by(id: params[:id])

    if @lecture.update(lecture_params)
      flash[:success] = "Successfully updated lecture"
      redirect_to "/cohorts/#{@lecture.cohort_id}"
    else
      flash[:warning] = "Lecture Not Updated"
      render :edit
    end
  end

  def destroy
    @lecture = Lecture.find_by(id: params[:id])
    cohort_id = @lecture.cohort_id
    @lecture.destroy
    flash[:success] = "Your lecture has been deleted"
    redirect_to "/cohorts/#{cohort_id}"
  end

  private

    def lecture_params
      params.require(:lecture).permit(
        :name,
        :start_time,
        :end_time,
        :notes,
        :cohort_id
      )
    end

    def set_timezone
      @lecture = Lecture.find_by(id: params[:id])
      old_timezone = Time.zone
      Time.zone = @lecture.cohort.timezone 
      yield
    ensure
      Time.zone = old_timezone
    end
end
