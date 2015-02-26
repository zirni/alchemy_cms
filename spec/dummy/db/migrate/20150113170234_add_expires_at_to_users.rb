class AddExpiresAtToUsers < ActiveRecord::Migration
  def change
    add_column :alchemy_users, :expires_at, :date
  end
end
