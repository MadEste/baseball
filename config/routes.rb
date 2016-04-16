Rails.application.routes.draw do

  	resources :leagues do
  		resources :teams
  	end
  	
	devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
   	get 'welcome/index'

	root 'leagues#index'

end
