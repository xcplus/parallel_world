class Code < ApplicationRecord
  include Pagable
  include Statusable
  # t.string :cid, comment: "唯一码"
  # t.string :name, comment: "名字"
  # t.float :price, default: 0.0
  # t.integer :status, default: 0, comment: "状态 0 可见 1 不可见"
  # t.string :style, comment: "配置类型"

  belongs_to :sub_node
  belongs_to :node
  belongs_to :brand

  before_validation :set_bid
  
  validates_uniqueness_of :cid, scope: :sub_node_id

  scope :search_codes, -> {where.not(style: "运费")}

  scope :trans_fee, -> { where(style: "运费") }

  default_scope { order(created_at: :desc) }

  private

  def set_bid
    if sub_node.present?
      self.node_id = sub_node.node_id
      self.brand_id = sub_node.node.brand_id
    end
  end
end
