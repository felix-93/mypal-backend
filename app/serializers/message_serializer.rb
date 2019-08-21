class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :text, :created_at, :username, :avatar

  def username
    self.object.user.username
  end

  def avatar
    self.object.user.avatar
  end

  def created_at
    self.object.created_at.strftime("%H:%M")
  end
end