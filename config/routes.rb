Rails.application.routes.draw do
    root 'topic#first'
    get '/article/:id' => 'article#single'
    get '/topic/:page' => 'topic#pages'
    mount Deploy::API => "/"
    mount Import::API => "/"
    mount Convert::API => "/"
    mount Testdata::API => "/"
end
