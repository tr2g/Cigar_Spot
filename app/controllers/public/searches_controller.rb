class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    #@reviewer_comments = ReviewerComment.where(params[:reviewer_comment_id])
    #@shops = Shop.where(params[:shop_id])

    if @range == "Shop" #検索するのがShopの場合
      @shops = Shop.where("name LIKE ?", "%#{params[:word]}%")
    elsif params[:tag_id] #タグ検索する場合
      @shops = Tag.find(params[:tag_id]).shops
    else
      @reviewer_comments = ReviewerComment.where("body LIKE?", "%#{params[:word]}%") #レビューを検索する場合
    end

  end
end
