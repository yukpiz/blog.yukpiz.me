Rails.application.routes.draw do
    root 'topic#first'
    get '/topic/:page' => 'topic#pages'

    get '/tags/:tag' => 'topic#first'
    get '/tags/:tag/:page' => 'topic#pages'

    get '/date/:date' => 'topic#first'
    get '/date/:date/:page' => 'topic#pages'

    get '/article/:id' => 'article#single'

    get '/posts' => 'xml#posts'

    mount Deploy::API => "/"
    mount Import::API => "/"
    mount Convert::API => "/"
    mount Testdata::API => "/"

end
