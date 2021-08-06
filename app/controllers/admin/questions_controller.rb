class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def edit
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to admin_test_path(@test)
    else
      render plain: 'Cannot create question'
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_not_found
    render plain: 'Question is not found'
  end
end
