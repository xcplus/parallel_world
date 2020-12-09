class Role < ApplicationRecord
  include Pagable
  # 角色表
  # t.string :name, comment: "角色名"
  # t.string :cid, comment: "角色编码"
  validates :name, :cid, uniqueness: true, presence: true
end
