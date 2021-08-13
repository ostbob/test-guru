class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_or_next_question, on: %i[create update]

  SUCCESS_SCORE = 85

  def completed?
    current_question.nil? || no_time?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids || [])
      self.correct_questions += 1
    end

    save!
  end

  def success_percentage
    100*correct_questions/test.questions.count
  end

  def successful?
    success_percentage >= SUCCESS_SCORE
  end

  def current_question_number
    if completed?
      test.questions.count
    else
      test.questions.count - next_questions.count
    end
  end

  def deadline_time
    created_at + test.allotted_time.minutes
  end

  def time_left
    [deadline_time - Time.now, 0].max
  end

  def time_left_string
    (time_left/60).to_i.to_s + ':' + (time_left%60).to_i.to_s
  end

  def no_time?
    return false if test.allotted_time == nil
    time_left == 0
  end

  private

  def before_validation_set_first_or_next_question
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_questions
    test.questions.order(:id).where('id > ?', self.current_question.id)
  end

  def next_question
    next_questions.first
  end

end
