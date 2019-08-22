class AddStatusToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :status, :boolean
  end
end
