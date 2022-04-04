class CreateGamesTagsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :games, :tags do |t|
      t.index :game_id
      t.index :tag_id
    end
  end
end
