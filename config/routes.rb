Rails.application.routes.draw do

  root 'sessions#new_teacher'
  get '/teachers/login' => 'sessions#new_teacher'
  post '/teachers/login' => 'sessions#create_teacher'
  get '/teachers/logout' => 'sessions#destroy_teacher'
  get '/students/login' => 'sessions#new_student'
  post '/students/login' => 'sessions#create_student'
  get '/students/logout' => 'sessions#destroy_student'
  
  get '/teachers' => 'teachers#dashboard'
  get '/teachers/sign_up' => 'teachers#new'
  post '/teachers' => 'teachers#create'
  get '/teachers/:id' => 'teachers#show'
  get '/teachers/:id/edit' => 'teachers#edit'
  patch '/teachers/:id' => 'teachers#update'
  delete '/teachers/:id' => 'teachers#destroy'

  get '/students' => 'students#dashboard'
  get '/students/sign_up' => 'students#new'
  post '/students' => 'students#create'
  
  get '/cohorts/new' => 'cohorts#new'
  post '/cohorts' => 'cohorts#create'
  get '/cohorts/:id' => 'cohorts#show'
  get '/cohorts/:id/edit' => 'cohorts#edit'
  patch '/cohorts/:id' => 'cohorts#update'
  delete '/cohorts/:id' => 'cohorts#destroy'

end
