class TeachersController < ApplicationController
  layout 'teachers'

  def index
  	@teacher = User.find(params[:id])
  	@students = User.all.where(teacher_id: current_user.id)
  end

  def show
  	@student = User.find(params[:id])
  end
end
