class AddCommentaryToSalves < ActiveRecord::Migration[6.0]
  def change
    add_column :salves, :commentary, :string
  end
end
