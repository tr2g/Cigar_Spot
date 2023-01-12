class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
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
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    shop.update(update_params)
    redirect_to admin_shop_path(shop.id)
  end



  #ストロングパラメーター
  private
    def shop_params
      params.require(:shop).permit(:name, :address, :access, :hours, :genre_id, :is_active)
    end
end
