class ChangeUserRolToUserRole < ActiveRecord::Migration[7.0]
  def change
    rename_column(:users, :rol, :role)
  end
end
