class CohortsController < ApplicationController

  def new
    @cohort = Cohort.new
    @teacher = Teacher.find(current_teacher)
  end

  def create
    @cohort = Cohort.create(cohort_params)
    redirect_to "/teachers"
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
