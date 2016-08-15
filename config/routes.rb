Rails.application.routes.draw do

  get '/teachers/login' => 'sessions#new_teacher'
  post '/teachers/login' => 'sessions#create_teacher'
  get '/teachers/logout' => 'sessions#destroy_teacher'
  
  root 'teachers#dashboard'
  get '/teachers' => 'teachers#index'
  get '/teachers/sign_up' => 'teachers#new'
  post '/teachers' => 'teachers#create'
  get '/teachers/:id' => 'teachers#show'
  get '/teachers/:id/edit' => 'teachers#edit'
  patch '/teachers/:id' => 'teachers#update'
  delete '/teachers/:id' => 'teachers#destroy'
end
