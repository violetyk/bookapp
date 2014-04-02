class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end


  def new
    @author = Author.new
    @users = User.all
  end


  def create
    @author = Author.new(params.require(:author).permit(:user_id, :name))
    if @author.save
      redirect_to authors_path
    else
      render 'new'
    end
  end


  def edit
  end


  def update

  end
end
