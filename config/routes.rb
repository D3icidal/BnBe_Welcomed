Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  #HOSTs (users)
  post '/hosts' => 'hosts#create'
  get '/hosts/new' => 'hosts#new'
  # get '/hosts' => 'hosts#index'
  get '/hosts/:id' => 'hosts#show'
  get 'hosts/:id/edit' => 'hosts#edit'  #Host goes to a page to submit edits for a home's details
  patch '/hosts/:id' => 'hosts#update'
  delete 'hosts/:id' => 'hosts#destroy' #changes db is_active

  #HOMEs (houses)
  post '/homes' => 'homes#create'       #Home is added to DB
  get '/homes/new' => 'homes#new'       #Host creates new home under their current_id
  get '/homes' => 'homes#index'         #Host sees all of their own homes, if more than one
  get '/homes/:id' => 'homes#show'      #Host sees one specific home
  get 'homes/:id/edit' => 'homes#edit'  #Host goes to a page to submit edits for a home's details
  patch '/homes/:id' => 'homes#update'  #Home - changes get commited to DB
  delete 'homes/:id' => 'homes#destroy' #Home gets marked as inactive in DB

end
