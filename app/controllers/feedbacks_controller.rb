class FeedbacksController < ApplicationController

  def new
    @feedback = current_user.feedbacks.build
  end

  def create
    @feedback = current_user.feedbacks.build(feedback_params)

    if @feedback.save
      FeedbackMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: "Feedback was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:title, :body)
    end
end
