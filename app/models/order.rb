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

  validates :order_no, uniqueness: true

  enum status: [:dealing, :dealed, :failed]

  scope :by_time, -> (start_time, end_time) {
    if start_time.present? && end_time.present?
      where({created_at: Time.parse(start_time).beginning_of_day..Time.parse(end_time).end_of_day})
    elsif start_time.present?
      where({created_at: Time.parse(start_time).beginning_of_day..Time.now})
    elsif end_time.present?
      where("created_at <= ?", Time.parse(end_time).end_of_day)
    end
  }

  before_validation do
    self.node_id = car.node_id
    self.brand_id = car.brand_id
    self.sub_node_id = car.sub_node_id
  end

  after_initialize :generate_order_no
  def generate_order_no
    return if self.order_no.present?
    self.order_no = Time.now.strftime("%Y%m%d%H%M%S") + Time.now.usec.to_s.ljust(6, "0")
  end

  after_commit :change_dealed_to_car

  def change_dealed_to_car
    if dealed?
      car.sold!
    elsif dealing?
      car.locked!
    else
      car.online!
    end
  end

  before_validation :check_car
  def check_car
    raise "该车源已经售出" if car.sold? && Order.where.not(car_id: self.id).dealed.count > 0
  end
end
