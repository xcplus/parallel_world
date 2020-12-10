class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :name, comment: "用户名"
      t.string :password_hash, comment: "密码hash"
      t.string :phone, comment: "手机号"
      t.string :email, comment: "邮箱"
      t.string :role_options, array: true, comment: "角色cids"

      t.timestamps
    end
  end
end
