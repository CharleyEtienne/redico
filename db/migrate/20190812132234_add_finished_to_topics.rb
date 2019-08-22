class AddFinishedToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :finished, :boolean
  end
end
