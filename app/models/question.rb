class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :answers_count

  private

  def answers_count
    errors.add(:self, 'Question must have only 1-4 answers') if not (1..4).include?(answers.count)
  end
end
