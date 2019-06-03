# frozen_string_literal: true

class Course < ApplicationRecord
  def create_course(params)
    course_params = validate_params(params)
    course = Course.new(course_params)
    if course.save
      return course
    else
      return nil
    end
    end

  def update_course(params); end

  def validate_params(params)
    params.require(:course).permit(
      :title,
      :professor,
      :code,
      :dates,
      :time
    )
  end
end
