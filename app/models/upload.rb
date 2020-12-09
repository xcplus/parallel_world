class Upload < ApplicationRecord
  # 用于存储图片
  has_one_attached :file
end
