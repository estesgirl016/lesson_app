Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  get 'students/show'

  get 'assignments/index'

  get 'assignments/practice'

  get 'assignments/new'

  get 'assignments/edit'

  get 'lessons/index'

  get 'lessons/new'

  get 'lessons/edit'

  get 'teachers/index'

  get 'teachers/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
