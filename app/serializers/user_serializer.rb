class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :title, :biography

  def title
    self.object.username
  end
end