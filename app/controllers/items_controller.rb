class ItemsController < ApplicationController
  
  #mishima
  before_action :authenticate_user!,except: [:index,:show,:toppage]
  
  def new
  end

  def toppage
  end

  def show
    render "items/items"
  end
  
  def buy
  end

end

