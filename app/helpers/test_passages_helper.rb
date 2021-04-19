module TestPassagesHelper

  def success_color_string(test_passage)
    if test_passage.successful?
      string_color = 'green'
      result_string = 'Test was passed.'
    else
      string_color = 'red'
      result_string = 'Test was failed.'
    end

    "<span style='color: #{string_color}'>#{test_passage.success_percentage}%</span> questions were correct.<p>#{result_string}</p>".html_safe
  end
end
