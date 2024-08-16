class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :find_org
  before_action :find_profile, only: [:show, :edit, :update]

  def index
    @profile = @organization.users.find_by(id:current_user.id).profile
  end
  
  def show
  end

  def new
    @profile = @organization.users.find_by(id:current_user.id).build_profile
    @profile.build_photo # Ensures the photo association is built
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
    params.require(:profile).permit(:date_of_birth,:gender,:phone_number,:address,:country,:occupation,:github_url,:user_id, :organization_id, photo_attributes: [:image])
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end