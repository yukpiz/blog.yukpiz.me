Rails.application.routes.draw do
    root 'topic#first'
    get '/topic/:page' => 'topic#pages'

    get '/tags/:tag' => 'topic#first'
    get '/tags/:tag/:page' => 'topic#pages'

    get '/date/:date' => 'topic#first'
    get '/date/:date/:page' => 'topic#pages'

    get '/article/:id' => 'article#single'

    mount Deploy::API => "/"
    mount Import::API => "/"
    mount Convert::API => "/"
    mount Testdata::API => "/"

    get '/xml/rss' => 'xml#rss'
end
