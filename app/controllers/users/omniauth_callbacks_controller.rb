#yamashita sns認証 コールバック処理の実装
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!, except: [:passthru]
  def facebook
    callback_from(:facebook)
  end

  def google_oauth2
    callback_from(:google)
  end

  def passthru
  end

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])
    session[:name] = @user.name
    session[:email] = @user.email
    session[:password] = @user.password
    session[:password_confirmation] = @user.password_confirmation
    session[:uid] = @user.uid
    session[:provider] = @user.provider
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to member_information_signup_index_path
    end
  end

end