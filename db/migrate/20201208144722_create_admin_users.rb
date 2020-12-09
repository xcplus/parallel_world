class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :password_hash
      t.string :phone
      t.string :email
      t.string :role_options, array: true, comment: "角色cids" 

      t.timestamps
    end
  end
end
