module ApplicationHelper

  BOOTSTRAP_ALERT_CLASSES = {alert: 'alert-warning',
                             error: 'aler-danger',
                             success: 'alert-success',
                             notice: 'alert-info' }

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

  def gist_hash(gist_url)
    gist_url['https://gist.github.com/'.length..]
  end

end
