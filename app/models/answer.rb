class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_answers, -> { where(correct: true) }

  validates :title, presence: true
  validate :answers_count, on: :create

  private

  def answers_count
    errors.add(:self, 'Question must have only 1-4 answers') if not (1..3).include?(question.answers.count)
  end
end
