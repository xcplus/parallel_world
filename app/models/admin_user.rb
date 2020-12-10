class AdminUser < ApplicationRecord
  include Pagable
  has_secure_password
  validates :name, presence: true
end
