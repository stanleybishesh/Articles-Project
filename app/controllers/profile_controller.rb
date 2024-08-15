class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :find_org

  def index
    @profile = current_user.profile
  end

  def new
    @profile = @organization.users.find_by(id:current_user.id).build_profile
  end

  def create
    @profile = @organization.users.find_by(id:current_user.id).build_profile(profile_params)
    if @profile.save
      redirect_to root_path, notice:"User Profile Successfully Created !", status: :created
    else
      redirect_to :new, notice: "Profile failed to create !", status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:date_of_birth,:gender,:phone_nunmber,:address,:country,:occupation,:github_url,:user_id, :organization_id)
  end
end
