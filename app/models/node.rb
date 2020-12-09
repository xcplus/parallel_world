class Node < ApplicationRecord
  include Pagable
  include Statusable
  # t.string :name, comment: "中文名"
  # t.string :english_name, comment: "英文名"
  # t.integer :status, default: 0, comment: "是否可见 0 可见 1 不可见"
  # t.references :brand, null: false, foreign_key: true, 对应的品牌
  belongs_to :brand
  has_many :sub_nodes
  has_many :codes
  has_many :cars

  delegate :name, :english_name, to: :brand, allow_nil: true, prefix: true
end
