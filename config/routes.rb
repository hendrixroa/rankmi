Rails.application.routes.draw do

  get 'departments/index'

  put 'departments/:id', to: 'departments#update'

  post 'departments/create'

end
