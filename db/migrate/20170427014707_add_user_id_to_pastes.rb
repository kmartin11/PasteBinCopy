class AddUserIdToPastes < ActiveRecord::Migration[5.0]
  def change
    add_column :pastes, :user_id, :integer
  end
end
