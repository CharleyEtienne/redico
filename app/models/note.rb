class Note < ApplicationRecord
  belongs_to :user
  belongs_to :message

  # validates :value, presence: true
end
