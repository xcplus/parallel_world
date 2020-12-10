class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0, comment: "订单状态 0 待跟进 1 已成交 2 成交失败"
      t.references :car, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :node, null: false, foreign_key: true
      t.references :sub_node, null: false, foreign_key: true
      t.string :order_no, comment: "订单编号"

      t.timestamps
    end
  end
end
