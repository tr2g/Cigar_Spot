class Public::ReviewerCommentsController < ApplicationController


  def index
    @reviewer_comments = ReviewerComment.active_comments
    @reviewer_comment = ReviewerComment.find(@reviewer_comments.ids)
    @shop = Shop.find(params[:shop_id])
    @shops = params[:tag_id].present? ? Tag.find(params[:tag_id]).shops : Shop.all
    #↑@shops=タグidがセットされてたらタグに関連づいたshopを取ってくる
  end

  def create
    shop = Shop.find(params[:shop_id])
    comment = current_reviewer.reviewer_comments.new(reviewer_comment_params)
    comment.score = Language.get_data(reviewer_comment_params[:body])
    comment.shop_id = shop.id
    comment.save!
    #tag_params[:tag_ids].reject(&:empty?).each { |tag_id| ShopTagRelation.create!(tag: Tag.find(tag_id), shop: shop)}
    redirect_to shop_path(params[:shop_id])
  end

  def show
    #@reviewer_comment_new = ReviewerComment.new
    #@reviewer = current_reviewer
    @reviewer_comment = ReviewerComment.find(params[:id])
    @shop = @reviewer_comment.shop
    @tags = @shop.tags.distinct
    #binding.pry

  end

  def edit
    @reviewer_comment = ReviewerComment.find(params[:id])
    @shop = @reviewer_comment.shop
  end

  def update
    @reviewer_comment = ReviewerComment.find(params[:id])
    @reviewer_comment.update(reviewer_comment_params)
    @shop = @reviewer_comment.shop
    redirect_to shop_path(@shop)
  end

  def destroy
    @reviewer_comment = ReviewerComment.find(params[:id])
    @reviewer_comment.destroy
    @shop = @reviewer_comment.shop
    redirect_to shop_path(@shop)
  end



  # ストロングパラメーター
  private
    def reviewer_comment_params
      params.require(:reviewer_comment).permit(:body, :star_rate)
    end

    # def tag_params
    #   params.require(:tag).permit(tag_ids:[])
    # end

end
