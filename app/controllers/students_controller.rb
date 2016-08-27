class StudentsController < ApplicationController
  layout 'students'

  def show
  	@student = User.find(params[:id])
  end
end
