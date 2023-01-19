class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "Shop"
      @shops = Shop.looks(params[:search], params[:word])
    elsif params[:tag_id]
      @shops = Tag.find(params[:tag_id]).shops
    else
      @reviewer_comments = ReviewerComment.looks(params[:search], params[:word])
    end

  end
end
