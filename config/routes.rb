Rails.application.routes.draw do

  get 'departments/index'

  put 'departments/:id', to: 'departments#update'

  post 'departments/:id', to: 'departments#create'

end
