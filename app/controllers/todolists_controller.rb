class TodolistsController < ApplicationController
    def index
        @works = Todolist.all 
    end 

    def show 
        @work = Todolist.find(params[:id])
    end 

    def new 
        @work = Todolist.new 
    end

    def create
        @work = Todolist.new(todolist_params)
        @work.user = current_user
        if @work.save 
            flash[:notice] = "Work was created successfully"
            redirect_to @work
        else 
            render "new"
        end 
    end 

    def edit
        @work = Todolist.find(params[:id])
    end 

    def update 
        @work = Todolist.find(params[:id])
        if @work.update(todolist_params)
            flash[:notice] = "Your work is updated successfully"
            redirect_to @work 
        else 
            render "edit"
        end 
    end 

    def destroy
        @work = Todolist.find(params[:id])
        @work.destroy
        redirect_to to_do_lists_path
    end 

    private 
    def todolist_params 
        params.require(:todolist).permit(:work)
    end 
end
