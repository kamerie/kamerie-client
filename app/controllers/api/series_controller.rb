class Api::SeriesController < ActionController::Base
  def index
    media = Series.where(media_params)
    render json: media, each_serializer: SeriesSerializer::Base, root: false
  end

  def show
    media = Series.find(params[:id])
    render json: media, serializer: SeriesSerializer::Full, root: false
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def media_params
    params.permit(:name)
  end
end
