class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :username, :time_mark, :type, :userid

  def username
    self.object.user.username
  end

  def userid
    self.object.user.id
  end

  def time_mark
    self.object.time_mark
  end

  def type
    self.object.class.name
  end

end
