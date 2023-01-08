class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

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
        flash[:notice] = "Welcome! You have signed up successfully."
    end

    def index
        @user = current_user
        @book = Book.new
        @books = Book.all
        @users = User.all

        #@user = User.new(user_params)
    end

    def show
        @users = current_user
        @books = Book.all
        @user = User.find(params[:id])
        @book = @user.books
        @book_new = Book.new
    end


    def destroy
        @user = User.find(params[:id])
    end

 def edit
        @user = User.find(params[:id])
        if @user.id == current_user.id
         @user.books == current_user
           render :edit
           
        else
             redirect_to user_path
        end
 end
 

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "You have updated user successfully."
            redirect_to user_path(@user.id)
        else
            #flash.now[:danger] = "Name is too short (minimum is 2 characters)"
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :introduction)
    end

end


  def correct_user
    @user = User.find(params[:id])
    @book = @user.books
    redirect_to(user_path) unless @user == current_user
  end
