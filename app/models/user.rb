class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts
    has_many :likes, through: :posts
    has_many :likes, through: :comments
    has_many :chatlogs
    has_many :messages
    has_many :conversations, through: :chatlogs


    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
end
