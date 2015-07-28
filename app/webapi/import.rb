module Import
    class API < Grape::API
        version 'v1', using: :path
        format :json

        helpers do
            def authenticate!
                error!("Unauthorized. Invalid token.", 401) unless current_user
            end

            def current_user
                return false if params[:user_name] != ENV["MAINTENANCE_USER_NAME"]
                return false if params[:password] != ENV["MAINTENANCE_PASSWORD"]
                @current_user = ENV["MAINTENANCE_USER_NAME"]
            end
        end

        resource :import do
            desc "Import Gist Files."
            get do
                authenticate!

                gist = Github::Gist.new
                gist.import
            end
        end
    end
end
