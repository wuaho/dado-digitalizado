class CreateBorrowings < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowings do |t|
      t.date :starts_on
      t.date :expires_on
      t.belongs_to :user
      t.belongs_to :game

      t.timestamps
    end
  end
end
