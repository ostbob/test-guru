module ApplicationHelper
  def footer_year
    Time.new.year
  end

  def github_url(author, repo, tag_body)
    link_to tag_body, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(alert)
    if flash[alert]
      content_tag :p, flash[alert], class: 'flash alert'
    else
      ''
    end
  end

  def bootstrap_alert_class(flash_message_type)
    case flash_message_type
      when 'alert'
        'alert-warning'
      when 'error'
        'alert-danger'
      when 'success'
        'alert-success'
      when 'notice'
        'alert-info'
    end
  end
end
