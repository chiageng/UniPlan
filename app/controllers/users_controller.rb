class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            flash[:primary] = "Registration successful. Login to your account now!"
            redirect_to todolists_path 
        else 
            render "new"
        end 
    end 

    def index 
        @users = User.all
    end 

    def show 
        @work = @user.todolists 
    end 

    def edit
    end 

    def update 
        if @user.update(user_params)
            flash[:success] = "Your account has been updated successfully"
            redirect_to todolists_path
        else 
            render "new"
        end 
    end 

    def destroy 
        @user.destroy 
        session[:user_id] = nil if @user == current_user
        flash[:success] = "Your account has been deleted successfully"
        redirect_to users_path
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end 

    def find_user
        @user = User.find(params[:id])
    end 

    def require_same_user
        if current_user != @user 
            flash[:danger] = "You cannot edit other people account"
            redirect_to users_path
        end 
    end 
end
