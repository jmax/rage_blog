class CommentSerializer
  include JSONAPI::Serializer

  attributes :body, :created_at, :updated_at

  belongs_to :article
end
