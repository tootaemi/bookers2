class UsersController < ApplicationController
    before_action :authenticate_user!
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
        @users = current_user
        @books = Book.all
        @users = User.all
        @user = User.new(user_params)
    end
    
    def show
        @user = User.find(params[:id])
        @books = @user.books.page(params[:page])
        @book = Book.new
        @users = current_user
    end
    
    def destroy
        @user = User.find(params[:id])
    end
    
    def edit
        @book = Book.find(params[:id])
        @book = Book.new
        if @book.user == current_user
            render :edit
        else
            redirect_to books_path
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
        params.permit(:name, :introduction)
    end
    
    def correct_user
        @user = User.find(params[:id])
        @user = @user.book
        redirect_to(users_path) unless @user == current_user
    end
end