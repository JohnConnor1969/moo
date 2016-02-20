class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.text :name
      t.text :link
      t.boolean :published, default: false

      t.timestamps null: false
    end
    add_index :channels, :name
    add_index :channels, :published
  end
end
