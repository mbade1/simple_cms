Rails.application.routes.draw do

  root 'demo#index'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :subjects do 
    member do #operates on a member of a resources (expects an ID)
      get :delete  
    end
  end

  resources :pages do 
    member do #operates on a member of a resources (expects an ID)
      get :delete  
    end
  end

  resources :sections do 
    member do #operates on a member of a resources (expects an ID)
      get :delete  
    end
  end


  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/escape_output'
  # get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
