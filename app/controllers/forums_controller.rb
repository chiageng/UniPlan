class ForumsController < ApplicationController
    before_action :forum_find, only: [:destroy, :update, :edit, :show]
    before_action :require_user, only: [:new, :create, :destroy, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        @forums = Forum.all 
    end 

    def new 
        @forum = Forum.new 
    end 

    def create 
        @forum = Forum.new(forum_params)
        @forum.user = current_user
        if @forum.save 
            flash[:notice] = "A new forum is created successfully"
            redirect_to @forum
        else 
            flash[:alert] = "The creation of forum is failed"
            render "new"
        end 
    end 

    def show
    end 

    def edit
    end 

    def update
        if @forum.update(forum_params)
            flash[:notice] = "Your forum has been updated successfully"
            redirect_to @forum 
        else 
            flash[:alert] = "Your forum edited failed"
            render "edit"
        end 
    end 

    def destroy 
        @forum.destroy 
        flash[:notice] = "Your forum has been deleted successfully"
        redirect_to forums_path
    end 

    private 
    def forum_params
        params.require(:forum).permit(:topic, :description)
    end 

    def forum_find 
        @forum = Forum.find(params[:id])
    end 

    def require_same_user
        if current_user != @forum.user 
            flash[:danger] = "You cannot delete some other people's forum"
            redirect_to forums_path
        end 
    end 
end
