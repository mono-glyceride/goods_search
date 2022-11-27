Rails.application.routes.draw do
	root 'registrations#index'
	resources :registrations
	resources :merchandise_forms
	# resources :merchandise_forms , only: %i[new]
	# post  '/merchandise_forms', to: 'merchandise_forms#create', as: 'create_merchandise_forms'

	devise_for :users, controllers: {
	  sessions: 'users/sessions',
	  omniauth_callbacks: 'users/omniauth_callbacks'
	}

end