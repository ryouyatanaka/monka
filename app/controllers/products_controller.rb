class ProductsController < ApplicationController
  def index
    @books = Book.visible.all
    @musics = Music.visible.all
    render layout: 'front'
  end
end
