module ProjectsHelper
  def format_pledging_ends_on(project)
    if project.expired?
      content_tag(:strong, "All Done!")
    else
      "#{time_ago_in_words(project.pledging_ends_on).capitalize} remaining"
    end
  end

  def image_for(project)
    image_tag(project.image_file_name)
  end
end
