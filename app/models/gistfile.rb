class Gistfile
    include Mongoid::Document
    include Mongoid::Timestamps

    field :filename, type: String
    field :type, type: String
    field :language, type: String
    field :raw_url, type: String
    field :size, type: Integer

    embedded_in :gist, :inverse_of => :gistfiles
end
