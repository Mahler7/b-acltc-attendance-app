class Api::V1::LecturesController < ApplicationController
  
  before_action :authenticate_teacher_and_student!

  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find_by(id: params[:id])
  end
end
