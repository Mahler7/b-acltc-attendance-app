class LecturesController < ApplicationController
  def new
    @lecture = Lecture.new
    @cohort = Cohort.find_by(id: params[:id])
  end

  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      flash[:success] = "Successfully created new lecture"
      redirect_to "/lectures/#{@lecture.id}"
    else
      flash[:warning] = "Lecture Not Created"
      render :new
    end
  end

  def show
    @lecture = Lecture.find_by(id: params[:id])
  end

  def edit
    @lecture = Lecture.find_by(id: params[:id])
  end

  def update
    @lecture = Lecture.find_by(id: params[:id])

    if @lecture.update(lecture_params)
      flash[:success] = "Successfully updated lecture"
      render :show
    else
      flash[:warning] = "Lecture Not Updated"
      render :edit
    end
  end

  def destroy
    @lecture = Lecture.find_by(id: params[:id])
    @lecture.destroy
    flash[:success] = "Your lecture has been deleted"
    redirect_to '/teachers'
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
end
