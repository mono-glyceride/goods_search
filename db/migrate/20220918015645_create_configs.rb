class CreateConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :configs do |t|
      t.boolean :notify_by_dm, null: false, default: true
      t.references :user, foreign_key: true, null: false, unique: true
      t.timestamps
    end
  end
end
