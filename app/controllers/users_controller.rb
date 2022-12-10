class UsersController < ApplicationController

def top
      @user =  User.find(params[:id])
   if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
       redirect_to user_path(@user.id)
   else
       render :index
   end
end



  def new
   @user = User.new
  end


   def index
     @user =  User.new(params[:id])
     @books = Book.all
     @book = Book.new

     @users = User.all
     @user = User.new
     @users = User.all
   end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @users = current_user
  end


  def destroy
    @user = User.find(params[:id])
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
     @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザー登録が完了しました'
      redirect_to user_path
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :index

    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
       flash.now[:danger] = "Name is too short (minimum is 2 characters)"
    render :edit
    end
  end


  private

   def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
   end
end