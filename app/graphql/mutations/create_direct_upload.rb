class Mutations::CreateDirectUpload < GraphQL::Schema::Mutation 
  class CreateDirectUploadInput < GraphQL::Schema::InputObject
    description "File information required to prepare a direct upload"

    argument :filename, String, required: true
    argument :byte_size, Int, required: true
    argument :checksum, String, required: true
    argument :content_type, String, required: true
  end

  argument :input, CreateDirectUploadInput, required: true

  class DirectUpload < GraphQL::Schema::Object
    description "Represents direct upload credentials"

    field :url, String, "Upload URL", null: false
    field :headers, String,
          "HTTP request headers (JSON-encoded)",
          null: false
    field :blob_id, ID, "Created blob record ID", null: false
    field :signed_blob_id, ID,
          "Created blob record signed ID",
          null: false
  end

  field :direct_upload, DirectUpload, null: false

  def resolve(input:)
    blob = ActiveStorage::Blob.create_before_direct_upload!(
        filename: input[:filename],
        byte_size: input[:byte_size],
        checksum: input[:checksum],
        content_type: input[:content_type]
    )

    {
        direct_upload: {
        url: blob.service_url_for_direct_upload,
        # Pass headers as JSON since they don't have a schema
        headers: blob.service_headers_for_direct_upload.to_json,
        blob_id: blob.id,
        signed_blob_id: blob.signed_id
        }
    }
    end

end

# add this mutation to your Mutation type
# field :create_direct_upload, mutation: CreateDirectUpload
