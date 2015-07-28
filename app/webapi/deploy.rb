module Deploy
    class API < Grape::API
        version 'v1', using: :path
        format :json

        resource :deploy do
            desc "Auto Deploy."
            post do
                github = Github::Webhook.new(request, params)
                github.pull
            end
        end
    end
end
