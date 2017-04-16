class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_actionで下で定義したメソッドを実行
  # 
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録とアカウント更新の際に、パラメータにnameが入るようにする
  PERMISSIBLE_ATTRIBUTES = %i(name, avatar_cache)

  protected

    #deviseのストロングパラメーターにカラム追加するメソッドを定義
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end

end
