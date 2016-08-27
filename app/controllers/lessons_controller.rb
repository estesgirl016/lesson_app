class LessonsController < ApplicationController
  #before_action :teacher, except: [:index, :new, :create]


  def index
    @user = User.find(params[:user_id])
    @lessons = @user.lessons
  end

  def new
    @user = User.find(params[:user_id])
    @lesson = @user.lessons.new
  end

  def create
    @user = User.find(params[:user_id])
    @lesson = Lesson.new(lesson_params)
    @lesson.user_id = @user.id
      if @lesson.save
        redirect_to assignment_index_path(@lesson)
      else
       render :new
      end    
    # lesson_params needs building
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to assignment_index_path(@lesson)
    else
      render :update
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])

    @lesson.destroy
    redirect_to lesson_index_path(@lesson.user_id)
  end 

  private

    def lesson_params
      params.require(:lesson).permit(:lesson_date, :feedback, :notes)
    end


end
