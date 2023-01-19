class Public::HomesController < ApplicationController

  def top
    @shops = Shop.order(created_at: :desc).limit(5)
    #@reviewer_comments = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviewer_comments : ReviewerComment.all
    @genres = Genre.all
  end

  def about
  end

end
