class TeachersController < ApplicationController

  def dashboard
    @teacher = Teacher.find(current_teacher)
  end

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      session[:teacher_id] = @teacher.id
      flash[:success] = "Successfully created account"
      redirect_to "/teachers"
    else
      flash[:warning] = "Account Not Created"
      render :new
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find_by(id: params[:id])
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
    
    if @teacher.update(teacher_params)
      flash[:success] = "Successfully updated account"
      render :show
    else
      flash[:warning] = "Update not successful"
      render :edit
    end
  end

  def destroy
    @teacher = Teacher.find_by(id: params[:id])
    @teacher.destroy
    flash[:success] = "Your profile has been deleted"
    redirect_to '/teachers/sign_up'
  end

  private

    def teacher_params
      params.require(:teacher).permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        :user_type,
        :password,
        :password_confirmation
      )
    end
end
