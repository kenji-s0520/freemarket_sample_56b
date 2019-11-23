#mishima 新規登録     画面遷移の記述を追加
class SignupController < ApplicationController
  before_action :authenticate_user!,except: [:user_reg,:user_reg2,:user_reg3,:user_reg4,:user_reg5,:create,:done,:address_create]

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
    session[:birthday] = birthday_join
    @user = User.new
  end

  def user_reg3
    @address = Address.new
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
      phone_number: user_params[:phone_number]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      redirect_to user_reg_signup_index_path
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    redirect_to user_reg3_signup_index_path
  end
  def address_create
    @address = Address.new(
      user_id: current_user.id,
      code: address_params[:code],
      prefectures: address_params[:prefectures],
      city_town: address_params[:city_town],
      address_number: address_params[:address_number],
      building: address_params[:building],
      room_for_number: address_params[:room_for_number]
    )
    if @address.save
      redirect_to user_reg4_signup_index_path
    else
      redirect_to user_reg3_signup_index_path
    end
  end
  private
    def user_params
      params.require(:user).permit(
        :user,
        :nickname, 
        :email, 
        :password, 
        :password_confirmation, 
        :last_name, 
        :first_name, 
        :last_name_kana, 
        :first_name_kana, 
        :birthday,
        :phone_number
      )
    end

    def address_params
      params.require(:address).permit(
        :code,
        :prefectures,
        :city_town,
        :address_number,
        :building,
        :room_for_number
      )
    end

    def birthday_join
      date = params[:user][:birthday]
        if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end
      Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  
    end
end