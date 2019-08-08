class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :img, :username, :time_mark, :likes, :comments

  def username
    self.object.user.username
  end

  def time_mark
    self.object.time_mark
  end

  def likes
    self.object.likes
  end

  def comments
    self.object.comments
  end


end