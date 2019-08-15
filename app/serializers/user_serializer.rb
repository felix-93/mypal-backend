class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :title, :biography, :year, :month, :day.fir, :avatar

  def title
    self.object.username
  end

  def year
    self.object.created_at.year
  end

  def month
    self.object.created_at.month
  end

  def day
    self.object.created_at.day
  end

end