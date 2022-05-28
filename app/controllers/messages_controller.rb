class MessagesController < ApplicationController
	before_action :load_entities
	before_action :require_user
	skip_before_action :verify_authenticity_token

	def create
		@message = Message.create user: current_user,
								  chat: @chat,
								  msg: params.dig(:message, :msg)
		redirect_to chat_path(@chat)
	end

	protected

	def load_entities
		@chat = Chat.find params.dig(:message, :chat_id)
	end

end
