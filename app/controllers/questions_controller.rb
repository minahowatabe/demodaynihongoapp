class QuestionsController < ApplicationController
  before_action :set_twitter_client 
  
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
     # ツイッター投稿 \rで改行
     @client.update!("「そうだん」に「新しい質問」が投稿されました！\r （タイトル ☞「#{@question.title}」）https://nihongokyooshinohoshiimono.herokuapp.com/")
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
