class TopicController < ApplicationController
    def first
        redirect_to controller: "topic", action: "pages", page: 1
    end

    def pages
        per_page = 5
        request_page = 0

        begin
            request_page = params[:page].to_i
            raise if request_page < 1
        rescue Exception => e
            render :file=>"#{Rails.root}/public/404.html",
                :status=>"404 Not Found." and return
        end

        skip_count = (request_page - 1) * per_page

        @articles = Article.where(:activate => true).
            sort(posted: -1).
            skip(skip_count).
            limit(per_page)

        render :file=>"#{Rails.root}/public/404.html",
            :status=>"404 Not Found." and
            return if Array(@articles).length == 0
    end
end
