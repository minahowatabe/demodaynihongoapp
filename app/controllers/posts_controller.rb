class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post].permit(:topic_id, :example, :memo))
    @post.save
    redirect_to topic_path(params[:post]['topic_id'])
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @post.destroy
    redirect_to topic_path(@topic)
  end
  
  def show
    @posts_count = Post.where(post_id: @post.id).count
    @posts = @posts.search(params[:search])
  end
    
end

