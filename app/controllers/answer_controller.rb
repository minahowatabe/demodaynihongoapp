class AnswerController < ApplicationController
  def create
    @answer = Answer.new(params[:answer].permit(:question_id, :name, :body))
    @answer.save
    redirect_to questions_show_path(params[:answer]['question_id'])
  end
  
  def delete
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to questions_show_path(@question)
  end
  
  def show
    @answers_count = answer.where(answer_id: @answer.id).count
    @answers = @answers.search(params[:search])
  end
end

