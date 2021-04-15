module QuestionsHelper
  def question_header(question)
    line_end = "#{question.test.title} Question"
    if question.new_record?
      "Create #{line_end}"
    else
      "Edit #{line_end}"
    end
  end
end
