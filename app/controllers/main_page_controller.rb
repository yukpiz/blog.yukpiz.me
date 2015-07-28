class MainPageController < ApplicationController
    def topic
        @articles = Article.where(:activate => true)
        puts @articles
    end
end
