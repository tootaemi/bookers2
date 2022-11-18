class UsersController < ApplicationController


  def new
   @user = User.new
  end


   def index
     @users = User.all
     @user = User.new
     @user = User.new(user_params)

     @book = @user.books
     @user = User.new
     @users = User.all

   end


  def show
    @user = User.find(params[:id])
    @books = @book.books.page(params[:page])
    @users = @user.users.page(params[:page])
    @books = @user.books
    @users = @book.users

    @book = Book.new
    @users = current_user
  end

  def destroy
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end



  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Book was successfully created."
      redirect_to user_path(@user.id)
    else
      @users = User.all
      render :index
    end
  end




  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to user_path(@user.id)
    else

    render :edit
    end
  end


   private

  def user_params
    params.permit(:name, :introduction, :image)
  end
end
