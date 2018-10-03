class TopicsController < ApplicationController
  def top
  end
  
  def index
    @topics = Topic.all
    @newTopic = Topic.new
    @topics = @topics.search(params[:search])
    @newpost = Post.new(topic_id: params[:id])     
  end

  # def create
  #   @topic = Topic.new(params[:topic].permit(:title))
  #   @topic.save
  #   redirect_to topics_path
  # end

  # def delete
  #   @topic = Topic.find(params[:id])
  #   @topic.destroy
  #   redirect_to topics_path
  # end
  
  def show
   @topic = Topic.find(params[:id])
   @newpost = Post.new(topic_id: params[:id]) 
   @posts = Post.where(topic_id: params[:id]) 
   
  end

end
