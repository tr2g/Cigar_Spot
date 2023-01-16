class Admin::ReviewersController < ApplicationController

  def index
    @reviewers = Reviewer.all
  end

  def show
    @reviewer = Reviewer.find(params[:id])
  end

  def edit
    @reviewer = Reviewer.find(params[:id])
  end

  def update
    @reviewer = Reviewer.find(params[:id])
    if reviewer.update(reviewer_params)
      redirect_to admin_reviewer_path(reviewer.id)
    else
      render edit_admin_reviewer_path(reviewer.id)
    end
  end



  #ストロングパラメーター
  private
    def reviewer_params
      params.require(:reviewer).permit(:nickname, :email, :is_deleted)
    end

end
