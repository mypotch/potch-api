class CreateCounters < ActiveRecord::Migration[5.2]
  def change
    create_table :counters do |t|
      t.references :countable, polymorphic: true
      t.integer :comments_count, default: 0
      t.integer :votes_count, default: 0
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
