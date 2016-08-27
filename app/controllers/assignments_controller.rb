class AssignmentsController < ApplicationController
  before_action :user
  before_action :assignment, only: [:edit, :update, :destroy]
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @assignments = @lesson.assignments.all
    # @user = current_user
  end

  

  def practice
    @assignment = Assignment.find(params[:id])
    @assignment.played += 1
    @assignment.save
    redirect_to :back
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.lesson_id = @lesson.id
      if @assignment.save
        redirect_to assignment_index_path(@lesson)
      else
        render :new
      end
  end

  def edit
    @lesson = Lesson.find(params[:lesson_id])
  end

  def update
    @lesson = Lesson.find(params[:lesson_id])
    if @assignment.update(assignment_params)
      redirect_to assignment_index_path(@lesson, @assignment)
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignment_index_path
  end

  private

  def user
    @user = current_user
  end

  def assignment_params
    params.require(:assignment).permit(:book, :title, :page, :per_day, :days_per_week, :notes, :lesson_id)
  end

  def assignment
    @assignment = Assignment.find(params[:id])
  end

  def lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
