module Types
  module Organizations
    class OrganizationType < Types::BaseObject
      field :id, ID, null:false
      field :name, String, null: false
    end
  end
end