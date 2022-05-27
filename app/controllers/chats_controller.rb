class ChatsController < ApplicationController
	before_action :load_entities
	before_action :require_user

	def index 
		@chats = Chat.all
	end

	def new
		@chat = Chat.new
	end

	def create
		@chat = Chat.new permitted_parameters

		if @chat.save
			flash[:success] = "Chat #{@chat.name} created!"
			redirect_to chats_path
		else
			flash[:danger] = "Plesae Try Again"
			render :new
		end
	end

	def edit
	end

	def update
		if @chat.update(permitted_parameters)
			flash[:success] = "Chat #{@chat.name} updated!"
			redirect_to chats_path
		else
			flash[:danger] = "Please Try Again 2"
			render :new
		end
	end

	def show
		@message = Message.new chat: @chat
		@messages = @chat.messages.includes(:user)

		render 'show'
	end

	protected

	def load_entities
		@chats = Chat.all
		@chat = Chat.find(params[:id]) if params[:id]
	end

	def permitted_parameters
		params.require(:chat).permit(:name)
	end
end
