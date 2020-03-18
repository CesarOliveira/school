class MaterialsController < ApplicationController
  before_action :set_material, only: %i[show update destroy]

  def index
    @materials = Material.all
  end

  def show
    render_show
  end

  def create
    @material = Material.new(material_params)

    if @material.save
      render :create, status: :created
    else
      render_model_error @material
    end
  end

  def update
    if @material.update(material_params)
      render :update, status: :ok
    else
      render_model_error @material
    end
  end

  def destroy
    if @material.destroy
      render_destroy
    else
      render_model_error @material
    end
  end

  private

    def material_params
      params
        .require(:material)
        .permit(:name,
                :path,
                :kind,
                :course_id)
    end

    def set_material
      @material = Material.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render_model_not_found e.to_s
    end
end
