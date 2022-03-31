class ChangeMembershipUserToNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :memberships, :user_id, false
  end
end
