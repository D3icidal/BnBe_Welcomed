Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  #HOSTs (users)
  post '/users' => 'users#create'
  get '/users/new' => 'users#new'
  # get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'  #Host goes to a page to submit edits for a home's details
  patch '/users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy' #changes db is_active

  #SESSIONS (host login)
  post "/sessions" => "sessions#create"  

  #HOMEs (houses)
  post '/homes' => 'homes#create'       #Home is added to DB
  get '/homes/new' => 'homes#new'       #Host creates new home under their current_id
  get '/homes' => 'homes#index'         #Host sees all of their own homes, if more than one
  get '/homes/:id' => 'homes#show'      #Host sees one specific home
  get 'homes/:id/edit' => 'homes#edit'  #Host goes to a page to submit edits for a home's details
  patch '/homes/:id' => 'homes#update'  #Home - changes get commited to DB
  delete 'homes/:id' => 'homes#destroy' #Home gets marked as inactive in DB

end
