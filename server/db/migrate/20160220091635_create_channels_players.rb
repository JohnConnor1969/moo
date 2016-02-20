class CreateChannelsPlayers < ActiveRecord::Migration
  def change
    create_table :channels_players, id: false do |t|
      t.integer :channel_id
      t.integer :player_id
    end
    add_index :channels_players, :channel_id
    add_index :channels_players, :player_id
  end
end
