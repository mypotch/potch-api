class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :author, polymorphic: true
      t.references :voteable, polymorphic: true
      t.string :ip, index: true

      t.timestamps
    end
  end
end
