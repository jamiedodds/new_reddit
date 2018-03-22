Rails.application.routes.draw do

  devise_for :users
	get 'articles/index'

	resources :articles do
		resources :comments
		member do
	    	post 'upvote'
	  	end
	end

	root to: 'articles#index'


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
