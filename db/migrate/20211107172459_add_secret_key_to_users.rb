class AddSecretKeyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :secret_key, :string
  end
end
