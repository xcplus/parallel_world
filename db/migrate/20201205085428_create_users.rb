class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, comment: "真实姓名"
      t.string :openid, comment: "微信openid"
      t.string :phone, comment: "手机号"
      t.string :email, comment: "邮箱"
      t.string :session_key, comment: "会话密钥"
      t.string :company_name, comment: "公司名称"
      t.string :company_addr, comment: "公司地址"
      t.string :company_qual, comment: "公司资质"
      t.integer :status, default: 0, comment: "状态"
      t.string :avatar, comment: "头像"
      t.string :nickname, comment: "昵称"
      t.string :area, comment: "地区"
      t.datetime :last_time, comment: "最后一次登陆时间"

      t.timestamps
    end
  end
end
