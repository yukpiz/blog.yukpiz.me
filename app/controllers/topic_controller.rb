class TopicController < ApplicationController
    def first
        @articles = Article.where(
            :activate => true).sort(posted: -1)
    end
end
