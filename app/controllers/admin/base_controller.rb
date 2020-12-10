class Admin::BaseController < ApplicationController
  include ActionController::Cookies
  class AuthorizationError < StandardError;end
  class NoTokenError < StandardError;end
  # class PermissionError < StandardError;end
  

  rescue_from AuthorizationError, with: :authorization_error
  # rescue_from PermissionError, with: :permission_error

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  rescue_from RuntimeError, with: :runtime_error

  # rescue_from NoTokenError,
  #             JWT::VerificationError,
  #             JWT::DecodeError,
  #             JWT::ExpiredSignature,
  #             with: :token_error

  helper_method :current_user

  before_action :required_login

  private

  def required_login
    unless current_user.present?
      render json: { ret: -1, msg: '请先登陆', data: nil } and return
    end
  end

  def current_user
    @current_user ||= AdminUser.find_by(id: cookies.signed[:blckd])
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

  def runtime_error(msg)
    render json: {ret: -1, msg: msg}    
  end
end