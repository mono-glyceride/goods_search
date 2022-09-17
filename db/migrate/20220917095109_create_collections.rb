class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.references :tweet, foreign_key: true, null: false
      t.references :supplying, foreign_key: { to_table: 'items' }
      t.references :demanding, foreign_key: { to_table: 'items' }
      t.timestamps
    end
    # 必ずしも需要と供給両方のグッズが見つかるとは限らないためコメントアウト
    # 求めるグッズは分かっても、譲るグッズの分析ができない、とか
    # add_index  :collections, [:tweet, :supplying, :demanding], unique: true
  end
end
