class Gisthead
    include Mongoid::Document
    include Mongoid::Timestamps

    field :id, type: String
    field :url, type: String
    field :html_url, type: String
    field :description, type: String
    field :comment, type: Integer
    field :public, type: Mongoid::Boolean
    field :created, type: String
    field :updated, type: String

    embeds_many :gistfiles do
        def find_by_base(base)
            where(base: base)
        end
    end
end
