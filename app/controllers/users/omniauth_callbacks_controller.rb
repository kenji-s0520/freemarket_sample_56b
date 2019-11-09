class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end


  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"])
    @user = info[:user]
    sns_id = info[:sns_id]
    # binding.pry
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.sns_id"] = sns_id
      render template: "devise/registrations/new"
    end
  end

  def failure
    redirect_to root_path and return
  end
end