class ImagesController < ApplicationController
  def create
    @image = Image.create!(create_params)
  end

  private

  def create_params
    params.require(:image).permit(:item_id, :file)
  end
end
  
