class Admin::ShopPaymentsController < ApplicationController

  def index
    @shop_payment = ShopPayment.new
    @shop_payments = ShopPayment.all
  end

  def create
    @shop_payment = ShopPayment.new(shop_payment_params)
    if @shop_payment.save
      redirect_to admin_shop_payment_path(@shop_payment.id)
    else
      @shop_payments = ShopPayment.all
      render :index
    end
  end

  def edit
    @shop_payment = ShopPayment.find(params[:id])
  end

  def update
    shop_payment = ShopPayment.find(params[:id])
    shop_payment.update(shop_payment_params)
    redirect_to admin_shop_payments_path
  end

  def destroy
    shop_payment = ShopPayment.find(params[:id])
    shop_payment.destroy
    redirect_to admin_shop_payments_path, notice: "削除しました"
  end



  #ストロングパラメーター
  private
    def shop_payment_params
      params.require(:shop_payment).permit(:payment_name)
    end

end
