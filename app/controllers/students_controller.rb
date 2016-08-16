class StudentsController < ApplicationController

  def dashboard
    @student = Student.find(current_student)
  end

  def new
    @student = Student.new
    @cohorts = Cohort.all
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      session[:student_id] = @student.id
      flash[:success] = "Successfully created new account"
      redirect_to "/students"
    else
      flash[:warning] = "Account Not Created"
      render :new
    end
  end
  
  private

    def student_params
      params.require(:student).permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        :user_type,
        :password,
        :password_confirmation,
        :cohort_id
      )
    end
end
