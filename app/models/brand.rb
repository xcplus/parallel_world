class Brand < ApplicationRecord
  include Pagable
  include Statusable
  # name 中文名称
  # english_name 英文名称
  # status 默认 0 可见 1 不可见
  has_many :nodes
  has_many :sub_nodes
  has_many :codes
  has_many :cars
end
