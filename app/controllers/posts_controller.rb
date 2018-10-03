class PostsController < ApplicationController
  before_action :set_twitter_client

  def create
    @post = Post.new(params[:post].permit(:topic_id, :example, :memo, :image))
    @post.save
     # ツイッター投稿 \rで改行
     # 同じ投稿だとエラーになるので、Time.currentを追加
     @client.update!("「ふだんの日本語あつめ」に「実例」が投稿されました！\r #{Time.current} https://nihongokyooshinohoshiimono.herokuapp.com/")
     redirect_to topic_path(params[:post]['topic_id'])
  end
  
  def destroy
  #   binding.pry
    # @topic = Topic.find(params[:id])
    @post = Post.find(params[:id])
    
    # binding.pry

    # @post = @topic.posts.find(params[:post_id])
    @post.destroy
    redirect_to topic_path(@post.topic)
    
    # 元々の記述
    # @topic = Topic.find(params[:topic_id])
    # @post = @topic.posts.find(params[:id])
    # @post.destroy
    # redirect_to topic_path(@topic)
  end
  
  def show
    # @posts_count = Post.where(post_id: @post.id).count
    # @posts = @posts.search(params[:search])
  end

private   
    
  def post_params
     params.require(:post).permit(:topic_id, :example, :memo, :image, :image_cache)
  end 
  
  # ツイッター投稿設定
  def set_twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end  
    
end

