class Api::V1::LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find_by(id: params[:id])
    @current_student = current_student.id
  end
end
