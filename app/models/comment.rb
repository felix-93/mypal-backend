class Comment < ApplicationRecord
  has_many :likes, as: :likeable, :dependent => :destroy
  belongs_to :post
  belongs_to :user

end
