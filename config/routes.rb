Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "mainpage#index"
  get "/products", to: 'product#prodview'
  get '/category', to: 'product#catview'

  post '/addcat', to: "product#addcat"
  post "/delcat/:id", to: "product#delcat"
  post "/edcat/:id", to: "product#edcat"
  post "/cancelcat/:id", to: "product#cancelcat"
  post "/confirmcat/:id", to: "product#confirmcat"
end
