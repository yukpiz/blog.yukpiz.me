require "openssl"

class Github::Webhook
    def initialize(request, params)
        @request = request
        @params = params
    end

    def pull
        headers = @request.headers
        eventtype = headers["X-Github-Event"]
        sha1 = headers["X-Hub-Signature"]

        puts @request.body
        puts sha1

        hmac = OpenSSL::HMAC.hexdigest("sha1", "aiueo", @request.body)
        puts hmac


        case eventtype
        when "push"
            return if @params["ref"] != "refs/heads/master"

            system("cd #{Rails.root}")
            system("git pull")
        else
            puts "It the assumed not events."
        end
    end
end
