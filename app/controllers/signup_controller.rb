class SignupController < ApplicationController

  def user_reg 
    @user = User.new
  end

  def user_reg2 
    session[:nickname] = user_params[:nickname]
  
  end

  def user_reg3
  end

  def user_reg4
  end

  def user_reg5
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
        :prefecture,
        :city_town,
        :address_number,
        :bulding,
        :room_phone_number

end
