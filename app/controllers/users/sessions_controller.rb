# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include CreateSession
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super do |resource|
      @organizations = Organization.all
    end
  end

  # POST /resource/sign_in
  def create
    @org = find_organization_by_org_id()
    @user = find_org_user_by_email()
    validate_organization()
    signin_if_valid_user()
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

end