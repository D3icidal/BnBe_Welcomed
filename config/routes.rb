Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  #HOSTs (users)
  post '/hosts' => 'hosts#create'
  get '/hosts' => 'hosts#index'
  get '/hosts' => 'hosts#show'
  patch '/hosts/:id' => 'hosts#update'
  delete 'hosts/:id' => 'hosts#destroy'
end
