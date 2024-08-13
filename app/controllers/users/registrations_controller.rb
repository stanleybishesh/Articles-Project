class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @organizations = Organization.all
    super
  end

  def create
    registration_service = ::Users::RegistrationService.new(params).execute
    if registration_service.success?
      redirect_to root_path, notice: 'Registration success'
    else
      redirect_to new_user_registration_path, notice: registration_service.errors
    end
  end
  
end
