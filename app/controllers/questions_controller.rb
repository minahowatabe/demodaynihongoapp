class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
    @newQuestion = Question.new
  # ransack
    @search = Question.search(params[:q])
    @questions = @search.result
  end
  
  def create
    @question = Question.new(params[:question].permit(:title, :content, :keyword))
      if @question.save
        redirect_to questions_path, notice:'質問を投稿しました！'
      else
        render 'index'
      end  
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
    @newAnswer = Answer.new(:question_id => params[:id])
    @answers = Answer.where(question_id: params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :keyword)
  end
end

