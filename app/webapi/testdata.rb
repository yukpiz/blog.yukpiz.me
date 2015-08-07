module Testdata
    class API < Grape::API
        version 'v1', using: :path
        format :json

        resource :testdata do
            desc "Create Test Data."
            get do
                for i in 1..100 do
                    Article.create!({
                        gist_id: "TestData#{i}",
                        title: "TestData#{i}",
                        tags: ["test1", "test2"],
                        posted: "2015-8-7",
                        activate: true,
                        source: "",
                        html: "",
                    })
                end
            end
        end
    end
end
