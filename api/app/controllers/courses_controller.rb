class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  def index
    @courses = Course.all
  end

  def show
    render_show
  end

  def by_name
    @courses = Course.where('lower(name) LIKE ?', "%#{params[:course_name].downcase}%").all

    render_index
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render :create, status: :created
    else
      render_model_error @course
    end
  end

  def update
    if @course.update(course_params)
      render :update, status: :ok
    else
      render_model_error @course
    end
  end

  def destroy
    if @course.destroy
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
      @course = Course.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render_model_not_found e.to_s
    end
end
