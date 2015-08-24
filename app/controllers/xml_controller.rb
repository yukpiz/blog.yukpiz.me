class XmlController < ApplicationController
    def rss
        @feed_title = "yuklog"
        @articles = Article.where({
            activate: true,
        }).sort(posted: -1)
    end
end
