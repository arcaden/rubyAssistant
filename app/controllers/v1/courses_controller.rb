# frozen_string_literal: true

class V1::CoursesController < ApplicationController
  require 'json'
  require 'httparty'

  def index
    courses = Course.all
    render json: courses, status: :ok
  end

  def create
    course = Course.create_course(params)
    status = if course
               :ok
             else
               :error
             end
    render json: course, status: status
  end

  def show
    course = Course.find(params[:code])
    render json: course, status: :ok
  end

  def update
    course = Course.find(params[:id])
    if Course.update(course_params)
      render json: course, status: :ok
    else
      render json: { errors: course.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    course = Course.find(params[:id])
    render json: course, status: :ok
    course.destroy
  end

  private def course_params
    params.require(:course).permit(
      :title,
      :professor,
      :code,
      :dates,
      :time
    )
  end
end
