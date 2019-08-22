class CreateRegles < ActiveRecord::Migration[6.0]
  def change
    create_table :regles do |t|
      t.integer :num
      t.string :content

      t.timestamps
    end
  end
end
