Rails.application.routes.draw do
  root to: "topics#top"
  get 'topics/index'
  # get 'topics/show'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  
  resources :topics do
     collection do
      get :about
     end
  end

  post 'posts/create' => 'post#create', as: :post_create
  delete 'posts/delete/:id' => 'posts#delete', as: :post_delete
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end