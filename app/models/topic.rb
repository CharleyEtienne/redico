class Topic < ApplicationRecord
  belongs_to :user
  has_many :salves, :dependent => :destroy
  has_many :participations, :dependent => :destroy

  def ma_salve(user, salve)
    user.id == salve.user.id
  end

  def je_participe(user, topic)
    Participation.where(user_id: user.id, topic_id: topic.id).exists?
  end

  def last_salve(user, last_salve)
    user.id == last_salve.user.id
  end
end
