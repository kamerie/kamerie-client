class Api::MediaController < ActionController::Base
  def index
    media = Media.where(media_params)
    render json: media, each_serializer: MediaSerializer, root: false
  end

  def show
    media = Media.find(params[:id])
    render json: media, serializer: MediaSerializer, root: false
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def media_params
    params.permit(:media_path, :media_type)
  end
end
