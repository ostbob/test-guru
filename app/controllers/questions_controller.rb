class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found


  def index
    @questions = @test.questions
    render 'index'
  end

  def show
    render 'show'
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.valid?
      question.save
      render plain: question.inspect
    else
      render plain: 'Cannot create question'
    end
  end

  def destroy
    @question.destroy
    redirect_to action: 'index'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_not_found
    render plain: 'Question is not found'
  end
end
