class HomeController < ApplicationController
	skip_before_action :authenticate_user!

  def index
  	if signed_in? && current_user.teacher?
  		redirect_to student_list_path(current_user.id)
  	elsif signed_in? && current_user.student? && Lesson.where(user_id: current_user.id).any?
      binding.pry
  		redirect_to assignment_index_path(Lesson.where(user_id: current_user.id).order('lesson_date').last)
    elsif signed_in? && current_user.student?
      redirect_to show_student_path(current_user)
  	else
  		render :index
  	end
  end
end