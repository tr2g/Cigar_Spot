class Public::SessionsController < Devise::SessionsController
  before_action :authenticate_reviewer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :email, :password, :password_confirmation, :is_deleted])
  end

  #退会してるかどうか確認
  before_action :reject_inactive_reviewer, only: [:create]

  #ゲストログイン用
  def guest_sign_in
    reviewer = Reviewer.guest
    sign_in reviewer #ゲストユーザーをログイン状態にする
    redirect_to root_path(reviewer),notice: 'ゲストユーザーとしてログインしました。'
  end




  protected
  #退会してるか判断するメソッド
  def reject_inactive_reviewer
    # 処理1⃣↓入力されたemailからアカウントを1件取得
    @reviewer = Reviewer.find_by(email: params[:reviewer][:email])
    # ↓アカウントを取得できなかった場合、このメソッドを終了する
    if @reviewer
    # 処理2⃣↓取得したアカウントのパスワードと入力されたパスワードが一致してるか判別
      if @reviewer.valid_password?(params[:reviewer][:password]) && @reviewer.is_deleted == true
        redirect_to new_reviewer_session_path
      end
    end
  end
end