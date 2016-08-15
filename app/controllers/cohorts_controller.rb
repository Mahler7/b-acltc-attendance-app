class CohortsController < ApplicationController

  def new
    @cohort = Cohort.new
    @teacher = Teacher.find(current_teacher)
  end

  def create
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      flash[:success] = "Successfully created new cohort"
      redirect_to "/teachers"
    else
      flash[:warning] = "Cohort Not Created"
      render :new
    end
  end

  def show
    @cohort = Cohort.find_by(id: params[:id])
  end
  
  def edit
    @teacher = Teacher.find(current_teacher)
    @cohort = Cohort.find_by(id: params[:id])
  end

  def update
    @cohort = Cohort.find_by(id: params[:id])

    if @cohort.update(cohort_params)
      flash[:success] = "Successfully updated cohort"
      redirect_to "/teachers"
    else
      flash[:warning] = "Cohort Not Updated"
      render :edit
    end
  end

  def destroy
    @cohort = Cohort.find_by(id: params[:id])
    @cohort.destroy
    flash[:success] = "Your cohort has been deleted"
    redirect_to '/teachers'
  end

  private

    def cohort_params
      params.require(:cohort).permit(
        :name,
        :start_date,
        :end_date,
        :teacher_id
      )
    end
end
