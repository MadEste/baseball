Rails.application.routes.draw do

  get 'teams/show'

  	resources :leagues do
  		resources :teams, only: :show
  	end
  	
	devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
   	get 'welcome/index'

	root 'leagues#index'

end
