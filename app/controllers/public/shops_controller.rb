class Public::ShopsController < ApplicationController

  def index
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @shops = @genre.shops.order(created_at: :desc).limit(5)
    else
      @shops = Shop.all #.order(created_at: :desc).limit(5)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_payments = ShopPayment.where(id: @shop.shop_payments.pluck(:id))
    #↑(whereで取ってくるidは@shopに紐づいたshop_paymentsのidカラム)
    @reviewer_comment = @shop.reviewer_comments.new
    @reviewer_comments = @shop.reviewer_comments.active_comments.limit(3).order(created_at: :desc)
    @tags = Tag.where(id: @shop.tags.pluck(:id))
  end


  #ストロングパラメーター
  private
    def shop_params
      params.require(:shop).permit(:shop_image, :name, :address, :introduction, :access, :hours, :genre_id, :is_active, shop_payment_ids:[])
    end

end
