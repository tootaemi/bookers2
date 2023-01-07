class BooksController < ApplicationController


 def top
  @user = User.find(params[:id])
  if @user.save
   flash[:notice] = "Welcome! You have signed up successfully."
   redirect_to user_path(@users.id)
  else
    render :index
  end
 end

 def new
  @book = Book.new
 end

 def index
  @book = Book.new
  @user = current_user
  @books = Book.all
  @users = User.all
 end

 def show
  @book_new = Book.new
  @book = Book.find(params[:id])
  @user = @book.user
 end

 def edit

  @book = Book.find(params[:id])
  if @book.user == current_user
    render :edit
  else
   redirect_to books_path
  end
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @books = Book.all
  if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book.id)
  else
    flash.now[:danger] = "投稿に失敗しました"
    render :index
  end
 end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
   end

   def destroy
    @book = Book.find(params[:id])
    if @book.destroy
     redirect_to books_path
    else
      render :index
    end
   end


   private
   def book_params
    params.require(:book).permit(:title, :body)
   end


end