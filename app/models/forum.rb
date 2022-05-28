class Forum < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :topic, presence: true
    validates :description, presence: true
end
