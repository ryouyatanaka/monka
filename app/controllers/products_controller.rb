class ProductsController < ApplicationController
  def index
    @books = Book.visible
    render layout: 'front'
  end
end
