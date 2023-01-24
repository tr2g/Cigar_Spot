class Admin::ShopsController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
  #byebug
  @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shop_path(@shop.id)
    else
      @shops = Shop.all
      render :index
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_payments = ShopPayment.where(id: @shop.shop_payments.pluck(:id))
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to admin_shop_path(shop.id)
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to admin_shops_path
  end



  #ストロングパラメーター
  private
    def shop_params
      params.require(:shop).permit(:shop_image, :name, :address, :introduction, :access, :hours, :genre_id, :is_active, shop_payment_ids: [])
    end
end
