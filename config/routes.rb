Rails.application.routes.draw do
  root to: "topics#top"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 
#  質問掲示板ページ
  get 'questions/index'
  get 'questions/show/:id' => 'questions#show', as: :questions_show
  post 'questions/create' => 'questions#create'
  delete 'questions/delete/:id' => 'questions#delete'
  post 'answers/create' => 'answer#create'
  delete 'answers/delete/:id' => 'answer#delete'

# コラム
  get 'columns/index'

# NihongoQuest!ページ
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  post 'posts/create' => 'post#create', as: :post_create
  delete 'posts/delete/:id' => 'posts#delete', as: :post_delete

# ABOUTページ  
  resources :topics do
     collection do
      get :about
     end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end