class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # ここから
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
      # ここまで修正する(サンプルだとなしだから削除予定)
    else
      # ここから
      render :new
      # ここまで修正する
    end
  end

  def index
    @books = Book.all  
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books/new'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
