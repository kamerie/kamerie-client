class Api::LibrariesController < ActionController::Base
  def index
    libraries = Library.where(library_params)
    render json: libraries, each_serializer: LibrarySerializer, root: false
  end

  def show
    library = Library.find(params[:id])
    render json: library, serializer: LibrarySerializer, root: false
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def library_params
    params.permit(:library_path, :library_type)
  end
end
