class ChangeEmailOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, :string, null: true
  end
end
