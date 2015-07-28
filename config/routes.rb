Rails.application.routes.draw do
  root 'main_page#topic'
  mount Deploy::API => "/"
  mount Import::API => "/"
  mount Convert::API => "/"
end
