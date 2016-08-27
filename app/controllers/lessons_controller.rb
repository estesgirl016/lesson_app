class LessonsController < ApplicationController
  before_action :teacher, except: [:index, :new, :create]


  def index
    @user_id = User_id.all.lesson_date
  end

  def new
    @lesson = Lesson.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    @lesson.destroy
    redirect_to lesson_path
  end 
  
end
