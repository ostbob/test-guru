class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.successful?
        @test_passage.update_attribute(:success, true)
        BadgeIssuerService.new(@test_passage).call
      end

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_question_service = GistQuestionService.new(@test_passage.current_question)
    response = gist_question_service.call

    flash_options = if gist_question_service.last_call_successful?
                      @test_passage.current_question.gists.create(url: response.html_url, user: current_user)
                      { notice: t('.success', url: response.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
