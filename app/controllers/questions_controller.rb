class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
    @newQuestion = Question.new
  end
  
  def create
    @question = Question.new(params[:question].permit(:title, :content))
    @question.save
    redirect_to questions_index_path
  end

  def delete
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_index_path
  end

  def show
    @question = Question.find(params[:id])
    @newanswer = Answer.new(:question_id => params[:id])
    @answers = Answer.where(question_id: params[:id])
  end

  # def question_params
  #   params.require(:question).permit(:title, :content, :keyword_list)
  # end
end

