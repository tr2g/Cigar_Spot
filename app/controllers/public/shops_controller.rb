class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_payments = ShopPayment.where(shop_payment_ids:[])
    #@reviewer_comments = ReviewerComment.where('is_active = true').last(3)
  end



  #ストロングパラメーター
  private
    def shop_params
      params.require(:shop).permit(:shop_image, :name, :address, :introduction, :access, :hours, :genre_id, :is_active, shop_payment_ids:[])
    end

end
