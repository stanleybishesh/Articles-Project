class Mutations::Users::CreateUser < Mutations::BaseMutation
  null true
  argument :organization_id, ID
  argument :name, String
  argument :email, String
  argument :password, String

  field :user, Types::Users::UserType
  field :errors, [String], null: false

  def resolve(organization_id:, name:, email:, password:)
    registration_service = ::Users::RegistrationService.new(params).execute
    if registration_service.success?
      {
        user: user,
        errors: []
      }
      redirect_to root_path, notice: 'Registration success'
    else
      redirect_to new_user_registration_path, notice: registration_service.errors
    end
    organization = Organization.find(organization_id)
    raise GraphQL::ExecutionError, "Organization not found" if organization.nil?
    user = organization.users.build(name: name, email: email, password: password)
    raise GraphQL::ExecutionError, "User already exists" if user.present?
    if user.save
      
    else
      {
        user: [],
        errors: [user.errors.full_messages]
      }
    end
  end

end