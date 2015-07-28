class Article
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title, type: String
    field :tags, type: Array
    field :posted, type: String
    field :activate, type: Mongoid::Boolean
    field :source, type: String
    field :html, type: String

end