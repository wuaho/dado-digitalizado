class AddDefaultMaxNumberOfPlayersToGames < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:games, :max_players, from: nil, to: 1)

  end
end
