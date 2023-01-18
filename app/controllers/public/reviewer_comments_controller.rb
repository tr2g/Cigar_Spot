class Public::ReviewerCommentsController < ApplicationController


  def index
    @reviewer_comments = ReviewerComment.all
    @reviewer_comment = ReviewerComment.find(@reviewer_comments.ids)
    @shop = Shop.find(params[:shop_id])
  end

  def create
    shop = Shop.find(params[:shop_id])
    comment = current_reviewer.reviewer_comments.new(reviewer_comment_params)
    comment.shop_id = shop.id
    comment.save!
    redirect_to shop_path(shop)
  end

  def show
    #@reviewer_comment_new = ReviewerComment.new
    @reviewer = current_reviewer
    @reviewer_comment = ReviewerComment.find(params[:id])
  end

  def edit
    @reviewer_comment = ReviewerComment.find(params[:id])
  end

  def update
    @reviewer_comment = ReviewerComment.find(params[:id])
    @reviewer_comment.update(reviewer_comment_params)
    redirect_to shops_path
  end

  def destroy
    @reviewer_comment = ReviewerComment.find(params[:id])
    @reviewer_comment.destroy
    redirect_to shops_path
  end



  # ストロングパラメーター
  private
    def reviewer_comment_params
      params.require(:reviewer_comment).permit(:body, :star_rate, tag_ids:[])
    end

end
