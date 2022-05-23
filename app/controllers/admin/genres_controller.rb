class Admin::GenresController < ApplicationController
  layout 'admin/application'

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to request.referer
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_items_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
