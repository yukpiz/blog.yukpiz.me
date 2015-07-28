class MainPageController < ApplicationController
    def topic
        @articles = Article.where(:activate => true).sort(posted: -1)
    end
end
