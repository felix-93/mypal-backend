class User < ApplicationRecord
    has_many :posts
    has_many :comments, through: :posts
    has_many :likes, through: :posts
    has_many :likes, through: :comments

    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
end
