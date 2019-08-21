class Conversation < ApplicationRecord
    has_many :messages
    has_many :chatlogs
    has_many :users, through: :chatlogs
  end  