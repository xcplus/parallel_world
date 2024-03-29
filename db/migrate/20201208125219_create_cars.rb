class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :node, null: false, foreign_key: true
      t.references :sub_node, null: false, foreign_key: true
      t.float :msrp, comment: "建议零售价格"
      t.string :particular_year, comment: "年份"
      t.float :sell_price, comment: "出售价格"
      t.float :freight, comment: "运费"
      t.float :open_fee, comment: "开证服务费"
      t.float :oversea_fee, comment: '海外仓服务费'
      t.string :cid, comment: "车源编码"
      t.string :code_options, array: true, comment: "配置项" 
      t.integer :status, default: 0, comment: "状态 0 下线 1 上线 2 已售出 3 已锁定"

      t.timestamps
    end
    add_index :cars, :cid
    add_index :cars, :code_options, using: 'gin'
  end
end
