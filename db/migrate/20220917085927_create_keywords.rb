class CreateKeywords < ActiveRecord::Migration[6.0]
  def change
    create_table :keywords do |t|
      t.string :body, null: false
      t.timestamps
    end
  end
end
