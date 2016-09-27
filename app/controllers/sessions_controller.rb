class SessionsController < ApplicationController
  def new_teacher
  end

  def create_teacher
    teacher = Teacher.find_by(email: params[:email])
    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      flash[:success] = 'Successfully logged in!'
      redirect_to '/teachers'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/teachers/login'
    end
  end

  def destroy_teacher
    session[:teacher_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/teachers/login'
  end
end
