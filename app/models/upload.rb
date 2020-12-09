class Upload < ApplicationRecord
  # 用于存储图片
  has_one_attached :file


  def attached_file_url(style: nil)
    return "" unless self.file.attached?
    return Rails.application.routes.url_helpers.upload_path(self.file.blob.key) if style.blank?
    Rails.application.routes.url_helpers.upload_path(self.file.blob.key, s: style)
  end
end
