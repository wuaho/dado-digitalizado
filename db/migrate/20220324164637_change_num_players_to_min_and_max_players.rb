class ChangeNumPlayersToMinAndMaxPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :number_of_players, :integer
    add_column :games, :min_players, :integer
    add_column :games, :max_players, :integer
  end
end
