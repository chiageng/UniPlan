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
        if @work.save 
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
