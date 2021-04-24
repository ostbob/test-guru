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
end
