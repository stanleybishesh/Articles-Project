class Mutations::Users::CreateUser < Mutations::BaseMutation
  null true
  argument :organization_id, ID
  argument :name, String
  argument :email, String
  argument :password, String

  field :membership, Types::Memberships::MembershipType
  field :user, Types::Users::UserType
  field :errors, [String], null: false

  def resolve(organization_id:, name:, email:, password:)
    organization = Organization.find(organization_id)
    raise GraphQL::ExecutionError, "Organization not found" if organization.nil?
    user = organization.users.build(name: name, email: email, password: password)
    raise GraphQL::ExecutionError, "User already exists" if User.find_by(email:user.email).present?
    if user.save
      membership = Membership.create(user_id: user.id, organization_id: organization_id)
      {
        membership: membership,
        user: user,
        errors: []
      }
    else
      {
        membership: [],
        user: [],
        errors: [user.errors.full_messages]
      }
    end
  end

end