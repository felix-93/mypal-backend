class LikeSerializer < ActiveModel::Serializer
  attributes :id, :newObject


  def newObject
    PostSerializer.new(self.object.likeable)
  end

end