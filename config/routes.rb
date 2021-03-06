Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Student
  #show
  get 'students/:id', to: 'students#show', as: 'show_student'

  # Teacher
  #index
  get 'teachers/:id/students', to: 'teachers#index', as: 'student_list'
  #show
  get 'teachers/:id', to: 'teachers#show', as: 'show_teacher'

  # Lesson
  #index
  get 'students/:user_id/lessons', to: 'lessons#index', as: 'lesson_index'
  #new 
  get 'students/:user_id/lessons/new', to: 'lessons#new', as: 'new_lesson'
  #create
  post 'students/:user_id/lessons/new', to: 'lessons#create'
  #update
  put 'lessons/:id', to: 'lessons#udpate'
  #edit
  get 'lessons/:id', to: 'lessons#edit', as: 'edit_lesson'
  #destroy
  delete 'lessons/:id', to: 'lessons#destroy', as: 'delete_lesson'

  # Assignments
  #index
  get 'lessons/:lesson_id/assignments', to: 'assignments#index', as: 'assignment_index'
  #new 
  get 'lessons/:lesson_id/assignments/new', to: 'assignments#new', as: 'new_assignment'
  #create 
  post 'lessons/:lesson_id/assignments/new', to: 'assignments#create', as: 'lesson_assignments'
  #update 
  patch '/lesson/:lesson_id/assignments/:id', to: 'assignments#update', as: 'lesson_assignment'
  #practice
  get 'practice/:id', to: 'assignments#practice', as: 'practice'
  #edit 
  get '/lesson/:lesson_id/assignments/:id', to: 'assignments#edit', as: 'assignment'
  #destroy 
  delete 'assignments/:id', to: 'assignments#destroy', as: 'delete_assignment'

end
