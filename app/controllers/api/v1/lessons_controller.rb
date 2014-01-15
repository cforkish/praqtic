class API::V1::LessonsController < ApplicationController
  skip_authorization_check

  def index
    @lessons = Lesson.all
    render :json => @lessons
  end
end
