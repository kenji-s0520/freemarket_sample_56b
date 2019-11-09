class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:user_sign_up,:user_reg,:user_reg2,:user_reg3,:user_reg4,:user_reg5]

  def index
  end

  def info
  end

  def card
  end

  def card_create
  end
  
  def edit
  end
  
  def log_out
  end

  def login
  end

  def logout
  end
  
  
  end
