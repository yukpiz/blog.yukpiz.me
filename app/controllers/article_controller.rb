class ArticleController < ApplicationController
    def single
        @article = Article.where(
            :gist_id => params[:id],
            :activate => true,
        ).first

        render :file=>"#{Rails.root}/public/404.html",
            :status=>"404 Not Found." and
            return unless @article
    end
end
