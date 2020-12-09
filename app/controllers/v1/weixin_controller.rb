require 'net/http'
module V1
  class WeixinController < BaseController
    # params
    # {code: "code的值"}
    def create
      res = get_wx_user_session_key if params[:code].present?
      @user = User.insert_or_update(JSON.parse(res))
    end

    private

    def get_wx_user_session_key
      appid = Rails.application.credentials[Rails.env.to_sym][:wx_xcx][:appid]
      secret = Rails.application.credentials[Rails.env.to_sym][:wx_xcx][:secret]
      # Rails.logger.info request.headers.inspect
      weixin_url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{appid}&secret=#{secret}&js_code=#{params[:code]}&grant_type=authorization_code";
      res = ::Net::HTTP.get(URI(weixin_url))
      res
    end
  end
end