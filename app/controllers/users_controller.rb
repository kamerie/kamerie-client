class UsersController < ApplicationController
  protect_from_forgery except: :globals

  def index
    render json: User.all, each_serializer: UserSerializer, root: false
  end

  def show
    render json: User.find(params[:id]), serializer: UserSerializer, root: false
  rescue ActiveRecord::RecordNotFound
    render json: {status: 404, message: 'Not found'}, status: :not_found
  end
end
