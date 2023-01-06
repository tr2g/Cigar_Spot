# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reviewer_state, only: [:create]

  protected
  #退会してるか判断するメソッド
  def reviewer_state
    # 処理1⃣↓入力されたemailからアカウントを1件取得
    @reviewer = Reviewer.find_by(email: params[:reviewer][:email])
    # ↓アカウントを取得できなかった場合、このメソッドを終了する
    return if !@reviewer
    # 処理2⃣↓取得したアカウントのパスワードと入力されたパスワードが一致してるか判別
    if @reviewer.valid_password?(params[:reviewer][:password])
    end
    #処理3⃣を記述！
  end




  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
