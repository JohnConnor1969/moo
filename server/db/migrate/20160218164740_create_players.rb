class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :number

      t.timestamps null: false
    end
    add_index :players, :number
  end
end
