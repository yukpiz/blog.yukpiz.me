module Deploy
    class API < Grape::API
        version 'v1', using: :path
        format :json

        resource :deploy do
            desc "Auto Deploy."
            post do
                deploy = Deploy::Webhook.new(request, params)
                deploy.pull
                "hogehoge"
            end
        end
    end
end
