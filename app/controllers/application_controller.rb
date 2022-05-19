# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resorse)
    books_url
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password name zip_code self_introduction address])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email password name zip_code self_introduction address])
  end
end
