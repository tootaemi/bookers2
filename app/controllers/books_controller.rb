class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

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
   @users = current_user
   @books = Book.all
   @book = Book.new(book_params)
  end



  def show
   @books = Book.all
   @book = Book.new(book_params)
   @user = @book.user
  end


def edit
   @book = Book.new
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
      redirect_to books_path
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
     flash[:notice] = "Book was successfully destroyed."
   else
    flash.now[:danger] = "削除に失敗しました"
    render :index
   end
 end

private
     def book_params
         params.require(:book).permit(:title, :body, :profile_image)
     end

def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
end
end
