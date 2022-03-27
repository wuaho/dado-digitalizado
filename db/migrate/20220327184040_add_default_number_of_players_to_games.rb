class AddDefaultNumberOfPlayersToGames < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:games, :min_players, from: nil, to: 1)
  end
end
