class SignupController < ApplicationController
  before_action :authenticate_user!,except: [:user_reg,:user_reg2,:user_reg3,:user_reg4,:user_reg5,:create]

  def user_reg 
    @user = User.new
  end

  def user_reg2 
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params[:birthday]  
    @user = User.new
  end

  def user_reg3
  end

  def user_reg4
  end

  def user_reg5
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to new_signup_path
    # else
    #   render '/signup/registration'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end
  private
   # 許可するキーを設定します
    def user_params
      params.require(:user).permit(
        :nickname, 
        :email, 
        :password, 
        :password_confirmation, 
        :last_name, 
        :first_name, 
        :last_name_kana, 
        :first_name_kana, 
        :birthday,
        :phone_number,
        :code,
        :prefectures,
        :city_town,
        :address_number,
        :bulding,
        :room_phone_number
      )
    end
end
