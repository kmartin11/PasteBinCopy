class AddUserEmailToPastes < ActiveRecord::Migration[5.0]
  def change
    add_column :pastes, :user_email, :string
  end
end
