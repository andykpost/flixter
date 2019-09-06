class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :enrolled_in?
  def show
    
  end

  private

  def enrolled_in?
    if !current_user.enrolled_courses.include?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: 'You are not Enrolled in this Course'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
