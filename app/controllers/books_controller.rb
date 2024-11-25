class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all 
      render :index

    end
  end

  def update
    book = Book.find(params[:id])  # モデル名を修正
    if book.update(book_params)   # 更新処理に成功した場合
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(book.id)
    else
      @book = book
      render :edit  # 編集画面を再表示
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
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end