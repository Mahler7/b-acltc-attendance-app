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

  def show
    @student = Student.find_by(id: params[:id])
  end

  def edit
    @student = Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])

    if @student.update(student_params)
      flash[:success] = "Successfully updated account"
      render :dashboard
    else
      flash[:warning] = "Update not successful"
      render :edit
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    cohort_id = @student.cohort_id
    @student.destroy
    flash[:success] = "This student has been deleted"
    redirect_to "/cohorts/#{cohort_id}"
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
