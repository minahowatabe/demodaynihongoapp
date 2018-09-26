Rails.application.routes.draw do
  if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
 
  root to: "topics#top"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 
# 質問掲示板ページ
  resources :questions
  resources :answers
  
  # # nestする書き方
  # resources :questions do
  #   resources :answers
  # end
  
  # get 'questions/index'
  # get 'questions/show/:id' => 'questions#show', as: :questions_show
  # post 'questions/create' => 'questions#create'
  # delete 'questions/delete/:id' => 'questions#delete', as: :question_delete
  # post 'answers/create' => 'answer#create', as: :answer_create
  # delete 'answers/delete/:id' => 'answer#delete', as: :answer_delete

# RealNihongoCollectionページ
  resources :topics
  resources :posts
  
  # get 'topics/index'
  # get 'topics/show/:id' => 'topics#show', as: :topics_show
  # post 'topics/create' => 'topics#create'
  # delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  # post 'posts/create' => 'post#create', as: :post_create
  # delete 'posts/delete/:id' => 'posts#delete', as: :post_delete

# ABOUTページ  
  get 'abouts/index'

# 日本語ぶんせきページ
  resources :labs

# コツとアイデアページ
  resources :ideas


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end