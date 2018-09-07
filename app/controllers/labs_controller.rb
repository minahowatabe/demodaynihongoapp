class LabsController < ApplicationController
 before_action :set_lab, only: [:show]    
    
  def index
    @labs = Lab.all
  end

  def new
    if params[:back]
      @lab = Lab.new(lab_params)
    else
      @lab = Lab.new
    end
  end
  
  def create
    @lab = Lab.new(lab_params)
  end
  
  def show
  end


  private
  def lab_params
    params.require(:lab).permit(:title, :content)
  end
  
  def set_lab
    @lab = Lab.find(params[:id])
  end
  
end
