Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "mainpage#index"
  get "/products", to: 'product#prodview'
  get '/category', to: 'product#catview'
  get "/type", to: 'product#typeview'
  get "/series", to: 'product#serview'


  post '/addcat', to: "product#addcat"
  post "/delcat/:id", to: "product#delcat"
  post "/edcat/:id", to: "product#edcat"
  post "/cancelcat/:id", to: "product#cancelcat"
  post "/confirmcat/:id", to: "product#confirmcat"

  post '/addtype', to: "product#addtype"
  post "/deltype/:id", to: "product#deltype"
  post "/edtype/:id", to: "product#edtype"
  post "/canceltype/:id", to: "product#canceltype"
  post "/confirmtype/:id", to: "product#confirmtype"


  post '/addser', to: "product#addser"
  post "/delser/:id", to: "product#delser"
  post "/edser/:id", to: "product#edser"
  post "/cancelser/:id", to: "product#cancelser"
  post "/confirmser/:id", to: "product#confirmser"
end
