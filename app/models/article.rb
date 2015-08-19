class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :gist_id, type: String
  field :title, type: String
  field :tags, type: Array
  field :posted, type: String
  field :activate, type: Boolean
  field :series, type: String
  field :source, type: String
  field :html, type: String
end
