class ProductsController < ApplicationController
  def index
    @books = Book.all
    render layout: 'front'
  end
end
