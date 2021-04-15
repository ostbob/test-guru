module ApplicationHelper
  def footer_year
    Time.new.year
  end

  def github_url(author, repo, a_parameter)
    link_to a_parameter, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
