class BooksController < ApplicationController
  def top
  end

  def new
   @book = Book.new
  end




  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end



  def index
    @users = current_user
    @books = Book.all
    @book = Book.new
  end


  def show
  @book = Book.find(params[:id])
  @user = @book.user
  @book = Book.new
  @books = Book.all
  end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to '/books'
 end


 private

 def book_params
   #params.require(:book).permit(:shop_name,:image,:caption)
   params.require(:book).permit(:title, :body, :image)
 end

  def edit
  end

end