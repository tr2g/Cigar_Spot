class Public::ShopsController < ApplicationController

  def index
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @shops = @genre.shops.order(created_at: :desc).limit(5)
    else
      @shops = Shop.order(created_at: :desc).limit(5)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_payments = ShopPayment.where(id: @shop.shop_payments.pluck(:id))
    @reviewer_comment = @shop.reviewer_comments.new
    @reviewer_comments = ReviewerComment.order(create_at: :desc).limit(3)
  end


  #ストロングパラメーター
  private
    def shop_params
      params.require(:shop).permit(:shop_image, :name, :address, :introduction, :access, :hours, :genre_id, :is_active, shop_payment_ids:[])
    end

end
