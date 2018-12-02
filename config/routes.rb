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
  # get '/homes/new' => 'homes#new'       #Host creates new home under their current_id
  get '/homes' => 'homes#index'         #Host sees all of their own homes, if more than one
  get '/homes/:id' => 'homes#show'      #Host sees one specific home
  get 'homes/:id/edit' => 'homes#edit'  #Host goes to a page to submit edits for a home's details
  patch '/homes/:id' => 'homes#update'  #Home - changes get commited to DB
  delete '/homes/:id' => 'homes#destroy' #Home gets marked as inactive in DB

  #BOOKINGS (stays)
  post '/bookings' => 'bookings#create'     #host creates new booking

  

  #BOOKING-SESSIONS (GUEST LOGINS)
  #get '/bookings/sessions/new' => 'booking_sessions#new'     #guestlogin to see home - handled in view
  post '/bookings/:booking_code'  => 'booking_sessions#create' #guestlogin create token session

  get '/bookings/:booking_code'  =>  'booking#show'  #guest go to home/ use home


  #WILDCARDs
  #get '/:booking_code'  => 'bookings#show'  #wildcard link to go straight to homes login/show - needs to redirect to guest login/show as necessary

  #need to work on TODO bookings, booking_sessions, Host-create guest session, Guest - login to session, Guest - view home, Gest logout, host force end session
end
