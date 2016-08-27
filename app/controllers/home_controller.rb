class HomeController < ApplicationController
	skip_before_action :authenticate_user!

  def index
  	if signed_in? && current_user.teacher?
  		redirect_to student_list_path(current_user.id)
  	elsif signed_in? && current_user.student?
  		redirect_to lesson.where(user_id: current_user.user_id).order('lesson_date').last
  	else
  		render :index
  	end
  end
end