Inspirovation::Application.routes.draw do

  resources :milestones

  resources :favorites

  resources :views

  resources :ratings

  resources :questions

  resources :subideas

  resources :maps

  resources :ideas

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  # set the root file
  
  match 'subideas/new/:extra' => 'subideas#new'
  match 'subideas/new/:extra/:parent_id' => 'subideas#new'
  
  match 'questions/new/:idea_id' => 'questions#new', :as => 'new_question'
  
  match 'ideas/:idea_id/voteup' => 'ratings#voteup', :as => 'voteup'
  match 'ideas/:idea_id/votedown' => 'ratings#votedown', :as => 'votedown'
  
  match 'milestones/new/:idea_id' => 'milestones#new', :as => 'new_milestone'
  match 'milestones/:id/edit/:idea_id' => 'milestones#edit', :as => 'edit_milestone'
  
  match 'ideas/:idea_id/add_my_favorite' => 'favorites#add_my_favorite', :as => 'add_my_favorite'
  
  match 'home/:action' => 'home#:action', :as => 'home'
  
  root :to => "home#index"
end
