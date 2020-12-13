class User < ApplicationRecord
  include Pagable
  # t.string :username, comment: "真实姓名"
  # t.string :openid, comment: "微信openid"
  # t.string :phone, comment: "手机号"
  # t.string :email, comment: "邮箱"
  # t.string :session_key, comment: "会话密钥"
  # t.string :company_name, comment: "公司名称"
  # t.string :company_addr, comment: "公司地址"
  # t.string :company_qual, comment: "公司资质"
  # t.integer :status, default: 0, comment: "状态 0 待审核 1 审核通过 2 审核不通过 3 禁用小程序"
  # t.string :avatar, comment: "头像"
  # t.string :nickname, comment: "昵称"
  # t.string :area, comment: "地区"
  # t.datetime :last_time, comment: "最后一次登陆时间"
  enum status: [:checking, :approved, :refused, :forbidden]

  has_many :orders

  validates :session_key, presence: true

  # 插入或更新
  def self.insert_or_update(opts)
    opts.symbolize_keys!
    user = User.find_or_initialize_by(openid: opts[:openid])
    user.session_key = opts[:session_key]
    user.last_time = Time.now
    user.save
    user
  end

  # 同步微信手机号
  def update_weixin_phone(opts)
    begin
      json_str = Aes128.decrypt(session_key, opts["iv"], opts["encrypted_data"])
      json_data = JSON.parse(json_str)
      Rails.logger.info "微信json-------#{json_data}"
      if json_data["purePhoneNumber"].present?
        self.update_column(:phone_num, json_data["purePhoneNumber"])
        return { ret: 1, data: { ent: "返回成功"} }
      else
        return { ret: -1, msg: "手机号绑定失败", data: nil }
      end
    rescue => exception
      return { ret: -1, msg: "手机号绑定失败", data: nil }
    end
  end
end
