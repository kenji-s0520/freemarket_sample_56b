def create
  #binding.pry
   if params[:user][:password] == ""
     params[:user][:password] = "Devise.friendly_token.first(6)"
     params[:user][:password_confirmation] = "Devise.friendly_token.first(6)"
     super
     # binding.pry
     sns = SnsCredential.update(user_id:  @user.id)
   else
     # binding.pry
     super
   end
 end