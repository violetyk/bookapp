class BooksController < ApplicationController
  def index
    # sessionのテスト
    session['user_agent'] = request.env['HTTP_USER_AGENT']
    @user_agent = session['user_agent']

    # cacheのテスト
    Rails.cache.write('remote_ip', request.remote_ip)
    @remote_ip = Rails.cache.read('remote_ip')

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
