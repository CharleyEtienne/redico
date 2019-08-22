class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :salve, null: false, foreign_key: true
      t.string :content
      t.string :name
      t.string :url
      t.string :location

      t.timestamps
    end
  end
end
