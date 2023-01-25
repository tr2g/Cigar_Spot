class Admin::ReviewerCommentsController < ApplicationController

  def destroy
    @reviewer_comment = ReviewerComment.find(params[:id])
    @reviewer_comment.destroy
    @shop = @reviewer_comment.shop
    redirect_to admin_shop_path(@shop)
  end

end
