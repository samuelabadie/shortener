Rails.application.routes.draw do
  
  root "home#index"
  post "/links", to: "links#create" # links -> LinksController
  get "/:lookup_code", to: "links#show"
  
end