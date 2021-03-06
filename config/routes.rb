Stockpicker::Application.routes.draw do

  match 'criterions/check_criterions' => 'criterions#check_criterions'
  match 'stocks/rate' => 'stocks#rate'
  match 'stocks/chart' => 'stocks#charts'
  match 'stocks/populate_watchlist/:id' => 'stocks#populate_watchlist'
  match 'stocks/populate_chartslist/:id' => 'stocks#populate_chartslist'
  match 'watch_lists/add_to_favorites/:stock' => 'watch_lists#add_to_favorites'
  match 'watch_lists/add_to_favorites/' => 'watch_lists#add_to_favorites'
  match 'scenarios/addCrit/:id' => 'scenarios#addCrit'
  match 'scenarios/addCrit/' => 'scenarios#addCrit'
  match 'scenarios/removeCrit/' => 'scenarios#removeCrit'
  match 'stocks/ajax/:id' => 'stocks#ajax'
  resources :scenarios
  resources :watch_lists
  resources :criterions
  #match 'stocks/rate' => 'stock#rate'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
     #match 'scenarios/add_criterion/:num_crits' => 'scenarios#add_criterion'
     #match 'scenarios/remove_criterion/:id/:criterion_id' => 'scenarios#remove_criterion'
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
   root :to => 'stocks#rate'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
