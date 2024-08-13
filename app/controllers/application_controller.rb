class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def find_org
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
  end
end
