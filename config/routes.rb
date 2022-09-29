Rails.application.routes.draw do
	root 'registrations#index'
	resources :registrations
	
	devise_for :users, controllers: {
	  sessions: 'users/sessions',
	  omniauth_callbacks: 'users/omniauth_callbacks'
	}
	
end