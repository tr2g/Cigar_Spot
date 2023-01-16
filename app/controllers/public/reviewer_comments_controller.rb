class Public::ReviewerCommentsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    comment = current_reviewer.reviewer_comments.new(reviewer_comment_params)
    comment.shop_id = shop.id
    comment.save
    redirect_to shop_path(shop)
  end

  def show
    @reviewer_comment = ReviewerComment.new
  end

  def edit
    @reviewer_comment = ReviewerComment.find(reviewer_comment_params)
  end

  def update
    @reviewer_comment = ReviewerComment.find(reviewer_comment_params)
    @reviewer_comment.update
    redirect_to shops_path
  end



  # ストロングパラメーター
  private
    def reviewer_comment_params
      params.require(:reviewer_comment).permit(:title, :body)
    end

end
