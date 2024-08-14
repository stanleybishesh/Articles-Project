module Users
  class RegistrationService

    attr_reader :params
    attr_accessor :success, :errors

    def initialize(params = {})
      @params = params
      @success = false
      @errors = []
    end

    def execute
      handle_registration
      self
    end

    def success?
      @success || @errors.empty?
    end

    def errors 
      @errors.join(', ')
    end

    private

    def handle_registration
      ActiveRecord::Base.transaction do
        user = User.new(signup_params)
        if organization.present?
          user.save!
          Membership.create!(user_id: user.id, organization_id: organization.id)
        end
        @success = true
        @errors = []
      end

      rescue ActiveRecord::Rollback => err
      @success = false
      @errors << err.message
    end

    def organization
      @organization ||= Organization.find(params[:organization_id])
    end

    def signup_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
    
  end
end
