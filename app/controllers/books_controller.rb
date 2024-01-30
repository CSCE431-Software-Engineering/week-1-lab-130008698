class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end




  def book_params
    params.require(:book).permit(:title)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to root_path
    else
      render :new
    end
  end
  
  def update
    @book = Book.find(params[:id])
  
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully edited.'
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book was successfully deleted.'
    redirect_to root_path
  end
end
