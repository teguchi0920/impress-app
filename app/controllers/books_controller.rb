class BooksController < ApplicationController
  def index
    @books = Book.all.order('created_at DESC')
  end
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:image, :title, :impress, :book_category_id).merge(user_id: current_user.id)
  end
end
