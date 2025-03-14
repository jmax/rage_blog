class ArticleSerializer
  include JSONAPI::Serializer

  attributes :title, :body, :created_at, :updated_at

  has_many :comments
end
