class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.string :cid, comment: "唯一码"
      t.string :name, comment: "名字"
      t.float :price, default: 0.0
      t.integer :status, default: 0, comment: "状态 0 可见 1 不可见"
      t.references :sub_node, null: false, foreign_key: true
      t.references :node, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
    add_index :codes, :cid
  end
end
