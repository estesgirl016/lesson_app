class AssignmentsController < ApplicationController
  before_action :lesson
  before_action :assignment, except: [:index, :new, :create]
  def index
    @assinments = @lesson.assinments.all
  end

  def practice

  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assigment_params)
    @assignment[:lesson_id] = params[:lesson_id]
      if @assignment.save
        redirect_to assignment_index_path(@lesson)
      else
        render :new
      end
  end

  def edit

  end

  def update
    if @assignment.update(assignment_params)
      redirect_to assignment_index_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignment_index_path(@lesson)
  end

  private

  def assignment
    @assignment = Assignment.find(params[:id])
  end

  def lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
