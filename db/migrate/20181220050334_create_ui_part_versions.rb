class CreateUiPartVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :ui_part_versions do |t|
      t.references :ui_part, foreign_key: true
      t.string :vid
      t.string :px_hash
      t.string :rem_hash
      t.string :desc

      t.timestamps
    end
    add_index :ui_part_versions, :vid
  end
end
