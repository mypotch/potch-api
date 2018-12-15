class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.references :author, polymorphic: true
      t.references :viewable, polymorphic: true
      t.string :ip, index: true

      t.timestamps
    end

  end
end
