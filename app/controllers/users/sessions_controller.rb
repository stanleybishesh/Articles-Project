class Users::SessionsController < Devise::SessionsController
  include CreateSession

  def new
    @organizations = Organization.all
    super
  end

  def create
    @org = find_organization_by_org_id
    @user = find_org_user_by_email
    validate_organization
    signin_if_valid_user
  end

end