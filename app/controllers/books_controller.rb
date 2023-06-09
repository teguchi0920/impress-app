class BooksController < ApplicationController
  def index
    if params[:keyword].present?
      @book = Book.search(params[:keyword]).order('created_at DESC')
    else
    @books = Book.all.order('created_at DESC')
    end
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
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  def search
    @books = Book.search(params[:keyword])
    render 'search'
  end

  private
  def book_params
    params.require(:book).permit(:image, :title, :impress, :book_category_id).merge(user_id: current_user.id)
  end
end
