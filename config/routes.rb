Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  #HOSTs (users)
  post '/hosts' => 'hosts#create'
  get '/hosts/new' => 'hosts#new'
  get '/hosts' => 'hosts#index'
  get '/hosts/:id' => 'hosts#show'
  patch '/hosts/:id' => 'hosts#update'
  delete 'hosts/:id' => 'hosts#destroy'

  #HOMEs (houses)
  post '/homes' => 'homes#create'
  get '/homes/new' => 'homes#new'
  get '/homes' => 'homes#index'
  get '/homes/:id' => 'homes#show'
  get 'homes/:id/edit' => 'homes#edit'
  patch '/homes/:id' => 'homes#update'
  delete 'homes/:id' => 'homes#destroy'

end
