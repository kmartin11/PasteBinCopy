class AddUsernameToPastes < ActiveRecord::Migration[5.0]
  def change
    add_column :pastes, :username, :string
  end
end
