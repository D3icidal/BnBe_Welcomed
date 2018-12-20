Rails.application.routes.draw do
  # resources :sections
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  #SECTIONS (of guide)
  post '/sections' => 'sections#create'
  get '/sections/:id/createAll' => 'sections#createAll', defaults: { format: 'json' }#creates a bunch of default sections at once.
  get '/sections/:id' => 'sections#show', defaults: { format: 'json' }

  

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
  # get '/homes/new' => 'homes#new'       #Host creates new home under their current_id
  get '/homes' => 'homes#index'         #Host sees all of their own homes, if more than one
  get '/homes/:id' => 'homes#show'      #Host sees one specific home
  get 'homes/:id/edit' => 'homes#edit'  #Host goes to a page to submit edits for a home's details
  patch '/homes/:id' => 'homes#update'  #Home - changes get commited to DB
  delete '/homes/:id' => 'homes#destroy' #Home gets marked as inactive in DB


  #BOOKINGS (stays)
  post '/bookings' => 'bookings#create'     #host creates new booking
  get '/bookings' => 'bookings#index' #Show all of hosts bookings for all homes.
  get '/bookings/:id' => 'bookings#show' #Show a single booking


  #AMENITIES
  get '/amenities/:home_id' => 'amenities#show' #show all amenities for a single home
  get '/amenities' => 'amenities#index' #show all amenities for a single home
  post '/amenities' => 'amenities#create' #create
  

  #GUIDES (GUEST LOGINS)
  patch '/guides/login/:id' => 'guides#update' #change code

  get '/guides/:code' => 'guides#show'
  #get '/bookings/sessions/new' => 'booking_sessions#new'     #guestlogin to see home - handled in view
  # post '/bookings/:booking_code'  => 'booking_sessions#create' #guestlogin create token session
  # get '/bookings/:booking_code'  =>  'booking#show'  #guest go to home/ use home



  #WILDCARDs
  #get '/:booking_code'  => 'bookings#show'  #wildcard link to go straight to homes login/show - needs to redirect to guest login/show as necessary

  #need to work on TODO bookings, booking_sessions, Host-create guest session, Guest - login to session, Guest - view home, Gest logout, host force end session
end
