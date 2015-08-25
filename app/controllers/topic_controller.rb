class TopicController < ApplicationController
    def first
        redirect_to controller: "topic", action: "pages", page: 1
    end

    def pages
        max_article = 5
        max_page = 5
        request_page = 0
        request_date = nil
        request_tag = nil

        begin
            request_date = params[:date]
            request_tag = params[:tag]
            request_page = params[:page].to_i
            raise if request_page < 1
        rescue Exception => e
            render :file=>"#{Rails.root}/public/404.html",
                :status=>"404 Not Found." and return
        end

        articles = nil
        if request_tag
            #タグ別ページ
            articles = Article.where({
                :activate => true,
                :tags.in => [request_tag],
            }).sort(posted: -1)
        elsif request_date
            #日付別ページ
            articles = Article.where({
                :activate => true,
                :posted => request_date,
            })
        else
            #記事一覧ページ
            articles = Article.where({
                :activate => true
            }).sort(posted: -1)
        end

        first_page = (request_page - 1) / max_page * max_page + 1
        last_page = (request_page + max_page - 1) / max_page * max_page

        div = articles.size / max_article
        mod = articles.size % max_article
        if div < last_page
            last_page = mod == 0 ? div : div + 1
        end

        @pagings = {}
        for p in first_page..last_page do
            @pagings[p] = p == request_page ? "active-page" : "link-page"
        end

        @jumps = {}
        if request_page == 1
            @jumps[:first] =
                ["link-disable", 1]
        else
            @jumps[:first] =
                ["link-enable", 1]
        end

        if first_page - max_page < 1
            @jumps[:prev] =
                ["link-disable", 1]
        else
            @jumps[:prev] =
                ["link-enable", first_page - max_page]
        end

        max_last_page = (articles.size.to_f / max_article.to_f).ceil
        if request_page >= max_last_page
            @jumps[:last] = ["link-disable", request_page]
        else
            @jumps[:last] = ["link-enable", max_last_page]
        end

        if last_page + 1 >= max_last_page
            @jumps[:next] = ["link-disable", request_page]
        else
            @jumps[:next] = ["link-enable", last_page + 1]
        end

        skip_count = (request_page - 1) * max_article
        @articles = articles.
            skip(skip_count).
            limit(max_article)

        render :file=>"#{Rails.root}/public/404.html",
            :status=>"404 Not Found." and
            return if Array(@articles).length == 0
    end
end
