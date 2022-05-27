class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat, inverse_of: :messages
end
