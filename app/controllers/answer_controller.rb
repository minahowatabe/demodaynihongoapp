class AnswerController < ApplicationController
  def create
    @answer = Answer.new(params[:answer].permit(:question_id, :name, :body))
    @question = Question.find(params[:answer][:question_id])
    @answer = @question.answers.build(answer_params)

    # @answer.save
    # redirect_to question_path(params[:answer]['question_id'])
    binding.pry
     if @answer.save
        redirect_to question_path(params[:answer]['question_id']), notice:'質問を投稿しました！'
     else
        render 'index'
     end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end
  
  def show
    # @answers_count = answer.where(answer_id: @answer.id).count
    # @answers = @answers.search(params[:search])
  end
  
 private 
  def answer_params
    params.require(:answer).permit(:name, :body)
  end

end

