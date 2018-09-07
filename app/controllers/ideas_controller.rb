class IdeasController < ApplicationController
 before_action :set_idea, only: [:show]    
    
  def index
    @ideas = Idea.all
  end

  def new
    if params[:back]
      @idea = Idea.new(idea_params)
    else
      @idea = Idea.new
    end
  end
  
  def create
    @idea = Idea.new(idea_params)
  end
  
  def show
  end


  private
  def idea_params
    params.require(:idea).permit(:title, :content)
  end
  
  def set_idea
    @idea = Idea.find(params[:id])
  end
  
end

