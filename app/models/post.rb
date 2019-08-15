class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, dependent: :destroy

  def time_mark
    if ((Time.now - self.created_at) / 3600) > 24 # Show days
    "#{((Time.now - self.created_at) / 3600 / 24).floor}d"
    elsif ((Time.now - self.created_at) / 3600) > 1
      "#{((Time.now - self.created_at) / 3600).floor}h"
    elsif ((Time.now - self.created_at) / 60) > 1 # Show minutes
      "#{((Time.now - self.created_at) / 60).floor}m"
    else ((Time.now - self.created_at) / 60) < 1 # Show seconds
      "#{(Time.now - self.created_at).floor}s"
    end
  end

end
