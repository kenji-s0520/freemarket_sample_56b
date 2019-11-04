class ItemsController < ApplicationController
  
  #mishima
  before_action :authenticate_user!,except: [:index,:show]
  
  def new
  end

  def index
  end

  def show
    render "items/items"
  end
  
  def buy
  end

end

