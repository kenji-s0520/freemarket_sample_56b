#mishima ユーザー新規登録 画面遷移の記述を追加
class SignupController < ApplicationController
  before_action :authenticate_user!,except: [:member_information,:phone_number,:create,:done,]

  def member_information
    if session[:uid].present?
    @user = User.new(
    nickname:session[:name],
    email:session[:email],
    password:session[:password],
    password_confirmation:session[:password_confirmation],
    uid:session[:uid],
    provider:session[:provider]
    )
    else
    @user = User.new
  end
  end
  
  def phone_number
    if verify_recaptcha and user_params[:nickname].present? and user_params[:email].present? and user_params[:last_name].present? and user_params[:first_name].present? and user_params[:last_name_kana].present? and user_params[:first_name_kana].present? and birthday_join
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      if !(session[:uid].present?)
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      end
      session[:last_name] = user_params[:last_name]
      session[:first_name] = user_params[:first_name]
      session[:last_name_kana] = user_params[:last_name_kana]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:birthday] = birthday_join
      @user = User.new
    else
      redirect_to member_information_signup_index_path
    end
  end

  def address
    if current_user.address.present?
      @address=current_user.address
    else
    @address = Address.new
    end
  end

  def card_information
  end

  def end
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
      phone_number: user_params[:phone_number],
      uid: session[:uid],
      provider: session[:provider]
    )

    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      redirect_to member_information_signup_index_path
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    redirect_to address_signup_index_path
  end
  
  def address_create
    @address = Address.new(
      user_id:current_user.id,
      code: address_params[:code],
      prefectures: address_params[:prefectures],
      city_town: address_params[:city_town],
      address_number: address_params[:address_number],
      building: address_params[:building],
      room_for_number: address_params[:room_for_number]
    )
    if @address.save
      redirect_to card_information_signup_index_path
    else
      redirect_to address_signup_index_path
    end
  end
  private
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
        :phone_number
      )
    end

    def address_params
      params.require(:address).permit(
        :user_id,
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