class AddDefaultValueToUserRol < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :rol, from: nil, to: 1)
  end
end
