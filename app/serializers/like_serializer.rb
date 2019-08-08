class LikeSerializer < ActiveModel::Serializer
  attributes :id, :newObject, :newLikes


  def newObject
    self.object.likeable
  end

  def newLikes
    self.object.likeable.likes.count
  end

end