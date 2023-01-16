class Public::ReviewersController < ApplicationController

  def update
    @reviewer = Reviewer.find(current_reviewer.id)
      if reviewer.update(reviewer_params)
        redirect_to reviewer_my_page_path
      else
        render reviewer_information_edit_path(reviewer.id)
      end
  end

  def withdrawal
    reviewer = Reviewer.find(params[:format])
    reviewer.update(is_deleted: true)
    reviewer.save
    reset_session
    redirect_to root_path
  end

  def unsubscribe
  end

  def index
  end

  def show
    @reviewer = Reviewer.find(current_reviewer.id)
  end

  def edit
    #@reviewer_comment = ReviewerComment.find(reviewer_comment_params)
    @reviewer = Reviewer.find(params[:id])
    if @reviewer != current_reviewer
      redirect_to reviewer_path(current_reviewer.id)
    end
  end

  private #ストロングパラメーター
    def reviewer_params
      params.require(:reviewer).permit(:nickname, :birthday, :email)
    end

end
