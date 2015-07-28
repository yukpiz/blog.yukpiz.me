Rails.application.routes.draw do
  root 'main_page#main'
  mount Deploy::API => "/"
  mount Post::API => "/"
end
