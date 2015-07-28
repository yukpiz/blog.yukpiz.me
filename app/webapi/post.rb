module Post
    class API < Grape::API
        version 'v1', using: :path
        format :json

        resource :post do
            desc "hoge"
            get do
                "get2!!"
            end
        end
    end
end
