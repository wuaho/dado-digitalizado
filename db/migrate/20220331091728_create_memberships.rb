class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.boolean :active
      t.date :started_on
      t.date :expires_on
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
