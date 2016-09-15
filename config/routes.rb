Rails.application.routes.draw do

  root 'sessions#new_teacher'

  namespace :api do
    namespace :v1 do
      get '/attendances' => 'attendances#index'
      post '/attendances' => 'attendances#create'
      get '/attendances/:id' => 'attendances#show'
    end
  end
  
  get '/teachers/login' => 'sessions#new_teacher'
  post '/teachers/login' => 'sessions#create_teacher'
  get '/teachers/logout' => 'sessions#destroy_teacher'
  get '/students/login' => 'sessions#new_student'
  post '/students/login' => 'sessions#create_student'
  get '/students/logout' => 'sessions#destroy_student'
  
  get '/teachers' => 'teachers#dashboard'
  get '/teachers/sign_up' => 'teachers#new'
  post '/teachers' => 'teachers#create'
  get '/teachers/:id/edit' => 'teachers#edit'
  patch '/teachers/:id' => 'teachers#update'
  delete '/teachers/:id' => 'teachers#destroy'

  get '/students' => 'students#dashboard'
  get '/students/sign_up' => 'students#new'
  post '/students' => 'students#create'
  get '/students/:id/edit' => 'students#edit'
  patch '/students/:id' => 'students#update'
  delete '/students/:id' => 'students#destroy'
  
  get '/cohorts/new' => 'cohorts#new'
  post '/cohorts' => 'cohorts#create'
  get '/cohorts/:id' => 'cohorts#show'
  get '/cohorts/:id/edit' => 'cohorts#edit'
  patch '/cohorts/:id' => 'cohorts#update'
  delete '/cohorts/:id' => 'cohorts#destroy'

  get '/lectures/new' => 'lectures#new'
  post '/lectures' => 'lectures#create'
  get '/lectures/:id' => 'lectures#show'
  get '/lectures/:id/edit' => 'lectures#edit'
  patch '/lectures/:id' => 'lectures#update'
  delete '/lectures/:id' => 'lectures#destroy'

end
