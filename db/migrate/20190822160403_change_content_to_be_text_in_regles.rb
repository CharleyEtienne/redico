class ChangeContentToBeTextInRegles < ActiveRecord::Migration[6.0]
  def change
    change_column :regles, :content, :text
  end
end
