class Car < ApplicationRecord
  include Pagable
  # t.references :brand, null: false, foreign_key: true
  # t.references :node, null: false, foreign_key: true
  # t.references :sub_node, null: false, foreign_key: true
  # t.float :msrp, comment: "建议零售价格"
  # t.string :particular_year, comment: "年份"
  # t.float :sell_price, comment: "出售价格"
  # t.float :freight, comment: "运费"
  # t.float :open_fee, comment: "开证服务费"
  # t.float :oversea_fee, comment: '海外仓服务费'
  # t.string :cid, comment: "车源编码"
  # t.string :code_options, array: true, comment: "配置项" 
  # t.integer :status, default: 0, comment: "状态 0 下线 1 上线 2 已售出 3 已锁定"
  belongs_to :brand
  belongs_to :node
  belongs_to :sub_node

  enum status: [:offline, :online, :sold, :locked]

  scope :visible_car, -> { includes(:brand, :node, :sub_node).where(brands: {status: "visible"}, nodes: {status: "visible"}, sub_nodes: {status: "visible"}) }

  before_validation do
    self.code_options = code_options.to_a.uniq
    self.node_id = sub_node.node_id
    self.brand_id = sub_node.brand_id
  end

  # 应该要用缓存
  def codes
    sub_node.codes.where(cid: code_options)
  end
end
