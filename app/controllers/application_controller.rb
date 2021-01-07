class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller? #デバイスコントローラー使用時

  private

  def configure_permitted_parameters #name・本名のカラム追加を許可
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :last_name, :first_name])
  end
end
