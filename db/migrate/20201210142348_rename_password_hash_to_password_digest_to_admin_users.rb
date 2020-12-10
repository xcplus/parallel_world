class RenamePasswordHashToPasswordDigestToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :admin_users, :password_hash, :password_digest
  end
end
