class UsersController < ApplicationController
    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            flash[:notice] = "Welcome to UniPlan"
            redirect_to todolists_path 
        else 
            render "new"
        end 
    end 

    def index 
        @users = User.all
    end 

    def show 
        @user = User.find(params[:id])
        @work = @user.todolists 
    end 

    def edit
        @user = User.find(params[:id])
    end 

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account has been updated successfully"
            redirect_to todolists_path
        else 
            render "new"
        end 
    end 

    def destroy 
        @user = User.find(params[:id])
        @user.destroy 
        session[:id] = nil
        flash[:notice] = "Your account has been deleted successfully"
        redirect_to users_path
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end 
end
