module Types
  module Users
    class UserType < Types::BaseObject
      field :name, String, null:false
      field :email, String, null:false
      field :password, String, null:false
    end
  end
end