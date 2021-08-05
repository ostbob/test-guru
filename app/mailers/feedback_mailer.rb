class FeedbackMailer < ApplicationMailer
  before_action :find_admin

  def send_feedback(feedback)
    @title = feedback.title
    @body = feedback.body
    @user = feedback.user
    mail(to: @admin.email, from: @user.email, subject: 'Feedback')
  end

  private

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end
