class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name, comment: "角色名"
      t.string :cid, comment: "角色编码"

      t.timestamps
    end
  end
end
