module Resolvers
    module Memberships
        class MembershipsResolver < BaseResolver
            type [Types::Memberships::MembershipType], null:false

            def resolve
                Membership.all
            end

        end
    end
end