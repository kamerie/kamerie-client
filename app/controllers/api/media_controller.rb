class Api::MediaController < ActionController::Base
  def index
    media = Media.where(media_params)
    render json: media, each_serializer: MediaSerializer::Base, root: false
  end

  def show
    media = Media.find(params[:id])
    render json: media, serializer: MediaSerializer::Full, root: false
  end

  def movies
    media = Media.movies.where(media_params.except(:media_type))
    render json: media, each_serializer: MediaSerializer::Base, root: false
  end

  def series
    media = Media.series.where(media_params.except(:media_type))
    render json: media, each_serializer: MediaSerializer::Base, root: false
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def media_params
    params.permit(:media_path, :media_type, :name)
  end
end
