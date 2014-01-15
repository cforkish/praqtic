Praqtic::Application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :lessons
    end
  end

  resources :users, except: :new
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories do
    resources :friends, controller: 'category_friendships'
    resources :parents, controller: 'category_relations'
  end
  resources :quizzes do
    resources :questions do
      resources :interactions, controller: 'question_interactions'
    end
    resources :lessons
    resources :prereqs, controller: 'quiz_dependencies'
    resources :postreqs, controller: 'quiz_dependencies'
    get 'do', on: :member
    post 'submit_question', on: :member
    get 'report', on: :member
  end
  resources :classifications
  resources :graph

  root 'pages#home'

  get '/signup'  => 'users#new'
  get '/signin'  => 'sessions#new'
  delete '/signout' => 'sessions#destroy'

  get '/help'    => 'pages#help'
  get '/about'   => 'pages#about'
  get '/contact' => 'pages#contact'

  get '/admin'   => 'admin#index'
  get '/admin/category/:id' => 'admin#category', as: :admin_category
  get '/admin/quiz/:id' => 'admin#quiz', as: :admin_quiz
  get '/admin/lesson/:id' => 'admin#lesson', as: :admin_lesson
  delete '/admin/destroy/:klass/:id'  => 'admin#destroy', as: :admin_destroy
  delete '/admin/destroy_multiple'    =>  'admin#destroy_multiple'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
