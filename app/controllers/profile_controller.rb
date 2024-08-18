class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :find_org
  before_action :find_profile, only: [:show, :edit, :update]

  def index
    @profile = org_current_user.profile
    if @profile.nil?
      redirect_to new_profile_pathg In
    end
  end
  
  def show
  end

  def new
    @profile = org_current_user.build_profile
    @profile.build_photo
  end

  def create
    @profile = org_current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path, notice:"User Profile Successfully Created !", status: :created
    else
      redirect_to :new, notice: "Profile failed to create !", status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: "User Profile Successfully Updated !", status: :ok
    else
      render :edit, notice: "Profile Update Failed !", status: :unprocessable_entity
    end
  end
  
  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:date_of_birth,:gender,:phone_number,:address,:country,:occupation,:github_url,:user_id, :organization_id, :facebook_url, :linkedin_url, :instagram_url, :twitter_url, photo_attributes: [:image])
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def org_current_user
    @organization.users.find_by(id:current_user.id)
  end
end
