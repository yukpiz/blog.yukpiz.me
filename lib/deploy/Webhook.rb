class Deploy::Webhook
    def initialize(request, params)
        @request = request
        @params = params
    end

    def pull
        puts @request
    end
end
