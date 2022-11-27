class CreateKeywords < ActiveRecord::Migration[6.0]
  def change
    create_table :keywords do |t|
      t.references :registration, foreign_key: true, null: false
      t.string :keyword, null: false
      t.timestamps
    end
  end
end
