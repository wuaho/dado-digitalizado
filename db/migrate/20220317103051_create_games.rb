class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :number_of_players
      t.integer :language
      t.integer :min_age
      t.string :brand
      t.integer :stock

      t.timestamps
    end
  end
end
