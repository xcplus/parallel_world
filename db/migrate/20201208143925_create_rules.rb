class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :mod_name, comment: "功能名"
      t.string :act_name, comment: "方法名"
      t.string :control, comment: "控制器"
      t.string :act, comment: "方法"

      t.timestamps
    end
  end
end
