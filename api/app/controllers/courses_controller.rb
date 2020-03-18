class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  def index
    @courses = CourseRepository.find_all
  end

  def show
    render_show
  end

  def by_name
    @courses = CourseRepository.find_by_name(params[:course_name])

    render_index
  end

  def create
    @course = CourseRepository.create(course_params)

    if CourseRepository.save(@course)
      render :create, status: :created
    else
      render_model_error @course
    end
  end

  def update
    if CourseRepository.update(@course, course_params)
      render :update, status: :ok
    else
      render_model_error @course
    end
  end

  def destroy
    if CourseRepository.destroy(@course)
      render_destroy
    else
      render_model_error @course
    end
  end

  private

    def course_params
      params
        .require(:course)
        .permit(:name,
                :details)
    end

    def set_course
      @course = CourseRepository.find_by_id(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render_model_not_found e.to_s
    end
end
