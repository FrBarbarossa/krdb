Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "mainpage#index"
  get "/products", to: 'product#prodview'
  get '/category', to: 'product#catview'
  get "/type", to: 'product#typeview'
  get "/series", to: 'product#serview'
  get "/client", to: "client#clientview"
  get "/card", to: "bonus#cardview"
  get '/bonuslog', to: "bonus#bonuslogview"
  get "/whlog", to: "warehouse#whlogview" 
  get "/seller", to: "seller#sellerview"
  get "/purchase", to: "purchase#purchaseview"


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

  post "/prodcreate", to: "product#prodcreate"
  post "/addprod", to: "product#addprod"
  post "/edprod/:id", to: "product#edprod"
  post '/confirmprod/:id', to: "product#confirmprod"
  post "/delprod/:id", to: "product#delprod"
  
  post "/clientcreate", to: "client#clientcreate"
  post "/addclient", to: "client#addclient"
  post "/edclient/:id", to: "client#edclient"
  post "/confirmclient/:id", to: "client#confirmclient"
  post "/delclient/:id", to: "client#delclient"

  post "/linkcard/:id", to: "bonus#linkcard"

  post "/whlogcreate", to: "warehouse#whlogcreate"
  post "/addwhlog", to: "warehouse#addwhlog"

  post "/sellercreate", to: "seller#sellercreate"
  post "/addseller", to: "seller#addseller"
  post "/edseller/:id", to: "seller#edseller"
  post "/confirmseller/:id", to: "seller#confirmseller"
  post "/delseller/:id", to: "seller#delseller"

  post "/purchasecreate", to: "purchase#purchasecreate"
  post "/addpurchase", to: "purchase#addpurchase"
end 
