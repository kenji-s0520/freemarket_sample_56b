class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # def create
  #   @image = Image.new(file_name: params[:file])
  #   if @image.save
  #     render json: { message: "success", fileID: @image.id }, :status => 200
  #   else
  #     render json: { error: @image.errors.full_messages.join(',')}, :status => 400
  #   end
  # end
  def new
    @item = Item.new
  end
  def create
    # itemが保存できたかどうかで、画像の保存を分岐させたいために、newです。
    @item = Item.new(create_params)
    if @item.save
  
      image_params[:images].each do |image|
        #buildのタイミングは、newアクションでも可能かもしれません。buildすることで、saveした際にアソシエーション先のテーブルにも値を反映できるようになります。
        @item.images.build
        item_image = @item.images.new(image: image)
        item_image.save
      end
        #今回は、Ajaxのみの通信で実装するためHTMLへrespondする必要がないため、jsonのみです。
      respond_to do |format|
        format.json
      end
    end
  end

  private
  def create_params
      # images以外の値についてのストロングパラメータの設定
      item_params = params.require(:item).permit(:name, :description,:category_id, :size, :brand_id, :condition, :select_shipping_fee, :shipping_method, :area, :shipping_date, :price)
      return item_params
  end
  def image_params
    #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    params.require(:images).permit({:images => []})
  end
end
