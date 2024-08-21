module Resolvers
    module Photos
        class PhotosResolver < BaseResolver
            type [Types::Photos::PhotoType], null:false

            def resolve
                Photo.all
            end

        end
    end
end