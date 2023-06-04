class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_date, :gender_id, :image_profile])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:nickname, :email, :password, :password_confirmation, :current_password,
                                             :image_profile])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :current_password,
                                  :password_visible, :image_profile).merge(user_id: current_user.id)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
