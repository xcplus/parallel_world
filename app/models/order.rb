class Order < ApplicationRecord
  include Pagable
  # status 0 待跟进 1 已成交 2 成交失败
  # status 0 dealing 1 dealed 3 failed
  belongs_to :user
  belongs_to :car
  belongs_to :brand
  belongs_to :node
  belongs_to :sub_node

  delegate :nickname, :phone, to: :user, allow_nil: true
  delegate :name, to: :brand, allow_nil: true, prefix: true
  delegate :name, to: :node, allow_nil: true, prefix: true
  delegate :name, to: :sub_node, allow_nil: true, prefix: true
  delegate :particular_year, to: :car, allow_nil: true

  # t.float :msrp, comment: "建议零售价格"
  # t.string :particular_year, comment: "年份"
  # t.float :sell_price, comment: "出售价格"
  # t.float :freight, comment: "运费"
  # t.float :open_fee, comment: "开证服务费"
  # t.float :oversea_fee, comment: '海外仓服务费'
  # t.string :cid, comment: "车源编码"
  # t.string :code_options, array: true, comment: "配置项" 
  # t.integer :status, default: 0, comment: "状态 0 下线 1 上线 2 已售出 3 已锁定"

  enum status: [:dealing, :dealed, :failed]

  before_validation do
    self.node_id = car.node_id
    self.brand_id = car.brand_id
    self.sub_node_id = car.sub_node_id
  end

  after_update :change_dealed_to_car

  def change_dealed_to_car
    raise "该车源已经售出" if car.sold?
    if dealed?
      car.sold!
    end
  end
end
