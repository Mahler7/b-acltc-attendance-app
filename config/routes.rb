Rails.application.routes.draw do

  root 'sessions#new_teacher'
  get '/teachers/login' => 'sessions#new_teacher'
  post '/teachers/login' => 'sessions#create_teacher'
  get '/teachers/logout' => 'sessions#destroy_teacher'
  
  get '/teachers' => 'teachers#dashboard'
  get '/teachers/sign_up' => 'teachers#new'
  post '/teachers' => 'teachers#create'
  get '/teachers/:id' => 'teachers#show'
  get '/teachers/:id/edit' => 'teachers#edit'
  patch '/teachers/:id' => 'teachers#update'
  delete '/teachers/:id' => 'teachers#destroy'
end
