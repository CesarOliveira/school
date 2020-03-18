module RenderingHelper
  def render_error(errors)
    render json: { error: errors }, status: :unprocessable_entity
  end

  def render_model_error(model)
    render_error model.errors.full_messages
  end

  def render_model_not_found(error)
    render json: { error: error }, status: :not_found
  end

  def render_show
    render :show, status: :ok
  end

  def render_destroy
    head :ok
  end
end
