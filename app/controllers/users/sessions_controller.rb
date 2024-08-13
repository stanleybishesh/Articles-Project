# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super do |resource|
      @organizations = Organization.all
    end
  end

  # POST /resource/sign_in
  def create
    # debugger
    @org = Organization.find_by(id: params[:organization_id])
    @user = @org.users.find_by(email: params[:email])
    if @org.nil?
      redirect_to new_user_session_path, notice: 'Organization not found.'
    end
    
    if !@user
      super do |resource|
        render :new, notice: 'User not found.'
      end
    else
      if !@user.valid_password?(params[:password])
        redirect_to new_user_session_path, notice: "Wrong password !"
      else
        sign_in_and_redirect @user
      end
    end
  end
end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
