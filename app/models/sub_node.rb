class SubNode < ApplicationRecord
  include Pagable
  include Statusable
  # t.string :name, comment: "中文名"
  # t.string :english_name, comment: "英文名"
  # t.integer :status, default: 0, comment: "是否可见 0 可见 1 不可见"
  # t.references :node, null: false, foreign_key: true
  # t.references :brand, null: false, foreign_key: true
  belongs_to :node
  belongs_to :brand
  has_many :codes
  has_many :cars


  before_validation :set_bid


  def styles
    opts = {}
    codes.search_codes.each do |x|
      if opts[x.style].present?
        opts[x.style] << x.name
      else
        opts[x.style] = [x.name]
      end
    end
    opts
  end

  private

  def set_bid
    if node.present?
      self.brand_id = node.brand_id
    end
  end
end
