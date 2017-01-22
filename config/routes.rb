Rails.application.routes.draw do
  resources :rewards
  devise_for :users
  resources :businesses
  resources :homes
  get 'home/index'

  root :to => "businesses#index"

	namespace :api, defaults: { format: :json } do
		  namespace :v1 do
		    devise_for :users, controllers: { registrations: 'api/v1/registrations', sessions: 'api/v1/sessions'}

		    resource :examples do
		      member do
		        get :action_test
		        get :get_businesses
		        get :get_rewards
		      end
		    end

		    resource :klopps do
		      member do
		        post :costumer_request
		        post :redeem
		        post :reject_request
		        get :costumer_requests
		      end
		    end

		    resource :rewards do
		      member do
		        post :costumer_request
		        post :redeem
		      end
		    end

		  end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
