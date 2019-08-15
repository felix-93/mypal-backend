class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts, dependent: :destroy
    has_many :likes, through: :posts, dependent: :destroy
    has_many :likes, through: :comments, dependent: :destroy

    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
end
