class CreateGeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :geeks do |t|
      t.string :category
      t.string :name
      t.text :description
      t.string :location
      t.integer :price
      t.boolean :active
      t.boolean :trusted
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
