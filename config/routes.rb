Rails.application.routes.draw do
  root 'topic#first'
  get '/article/:id' => 'article#single'
  mount Deploy::API => "/"
  mount Import::API => "/"
  mount Convert::API => "/"
end
