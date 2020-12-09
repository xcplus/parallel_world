class v1::BaseController < ApplicationController
  class AuthorizationError < StandardError;end
  class NoTokenError < StandardError;end
  class PermissionError < StandardError;end
  

  rescue_from AuthorizationError, with: :authorization_error
  rescue_from PermissionError, with: :permission_error

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  # rescue_from NoTokenError,
  #             JWT::VerificationError,
  #             JWT::DecodeError,
  #             JWT::ExpiredSignature,
  #             with: :token_error

  helper_method :current_user
  
  private

  def current_user
    @current_user ||= User.find_by(session_key: request.headers['wxSession']) 
  end

  def authorization_error
    render json: { ret: -1, msg: I18n.t('authorization.login_error'), data: nil }
  end

  def token_error
    render json: { ret: -1, msg: I18n.t('jwt.token.error'),  data: nil }
  end

  def record_invalid(invalid)
    render json: { ret: -1, msg: invalid.record.errors.full_messages.join(","), data: nil }
  end

  def wxx_token_error
    render json: { ret: -1, msg: 'token过期，请重试!', data: nil }
  end
end
