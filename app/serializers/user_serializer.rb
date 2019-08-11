class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :title

  def title
    self.object.username
  end
end