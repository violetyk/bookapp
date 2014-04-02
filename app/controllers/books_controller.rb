class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new

  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :price, :author_ids => []))
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

end
