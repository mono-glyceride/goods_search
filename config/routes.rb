Rails.application.routes.draw do
	root 'search_conditions#index'
	resources :search_conditions
	
	devise_for :users, controllers: {
	  sessions: 'users/sessions',
	  omniauth_callbacks: 'users/omniauth_callbacks'
	}
	
end