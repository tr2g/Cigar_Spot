class Public::HomesController < ApplicationController

  def top
    @shops = Shop.where
    @reviewer_comments = params[:tag_id].present? ? Tag.find(params[:tag_id]).reviewer_comments : ReviewerComment.all
  end

  def about
  end

end
