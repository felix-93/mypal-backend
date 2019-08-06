class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :img
  has_one :user
end
