class Message < ApplicationRecord
  belongs_to :user
  belongs_to :salve
  has_many :notes, :dependent => :destroy

  validates :content, presence: true
end
