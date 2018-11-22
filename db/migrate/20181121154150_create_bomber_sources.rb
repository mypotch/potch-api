class CreateBomberSources < ActiveRecord::Migration[5.2]
  def change
    create_table :bomber_sources do |t|
      t.string :title
      t.string :url
      t.integer :method, default: 0
      t.text :headers
      t.text :params
      t.text :data
      t.text :result

      t.string :remark

      t.timestamps
    end
  end
end
