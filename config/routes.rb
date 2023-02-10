Rails.application.routes.draw do
  get 'reviews/show'
  get 'books/show'
  get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/users/other_1", to: 'users#other_1'
  get "/users/other_2", to: 'users#other_2'
  get "/users/other_3", to: 'users#other_3'
  get "/users/:id", to: 'users#show'

  get "books/:id/reviews/", to: "reviews#show"
end
