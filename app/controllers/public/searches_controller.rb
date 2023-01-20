class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @reviewer_comments = ReviewerComment.where(params[:reviewer_comment_id])
    @shops = Shop.where(params[:shop_id])
    #@tags = Tag.find(params[:tag_id]).shops

    if @range == "Shop" #検索するのがShopの場合
      @shops = Shop.looks(params[:search], params[:word])
    elsif params[:tag_id] #タグ検索する場合
      @shops = Tag.find(params[:tag_id]).shops
    else
      @reviewer_comments = ReviewerComment.looks(params[:search], params[:word]) #レビューを検索する場合
    end

  end
end
