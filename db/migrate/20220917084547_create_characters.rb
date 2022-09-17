class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
    add_index :characters, :name  
  end
end
