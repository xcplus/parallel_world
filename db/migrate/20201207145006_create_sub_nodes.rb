class CreateSubNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_nodes do |t|
      t.string :name, comment: "中文名"
      t.string :english_name, comment: "英文名"
      t.integer :status, default: 0, comment: "是否可见 0 可见 1 不可见"
      t.references :node, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
