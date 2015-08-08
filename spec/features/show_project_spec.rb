describe "Viewing project page" do

  it "shows the project" do

    project = Project.create(project_attributes(target_pledge_amount: 50000))

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text("$50,000.00")
    expect(page).to have_text(project.website)
    expect(page).to have_text(project.team_members)
    expect(page).to have_selector("img[src$='#{project.image_file_name}']")
  end

  it "shows the number of days remaining if the pledging end date is in the future" do
    project = Project.create(project_attributes(pledging_ends_on: 31.days.from_now))

    visit project_url(project)

    expect(page).to have_text("About 1 month remaining")
  end

  it "shows 'All Done!' if the pledging end date is in the past" do
    project = Project.create(project_attributes(pledging_ends_on: 1.days.ago))

    visit project_url(project)

    expect(page).to have_text("All Done!")
  end

end
