class XmlController < ApplicationController
    def posts
        @feed_title = "yuklog"
        @feed_description = "yuklog"
        @articles = Article.where({
            activate: true,
        }).sort(posted: -1)

        respond_to do |format|
            format.rss
            format.atom
        end
    end
end
