module TestPassagesHelper

  def success_color_string(test_passage)
    if test_passage.successful?
      string_color = 'green'
      result_string = t('test_was_passed')
    else
      string_color = 'red'
      result_string = t('test_was_failed')
    end

    questions_string = t('questions_correct')
    "<span style='color: #{string_color}'>#{test_passage.success_percentage}%</span> #{questions_string}<p>#{result_string}</p>".html_safe
  end
end
