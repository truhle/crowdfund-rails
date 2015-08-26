describe "Creating a new project" do

  it "saves the project and shows the new project's data" do
    visit projects_url

    click_link "Add New Project"

    expect(current_path).to eq(new_project_path)

    fill_in "Name", with: "New Project Name"
    fill_in "Description", with: "A kick-ass new project for your funding enjoyment"
    fill_in "project_target_pledge_amount", with: "50000"
    # select (Time.now.month + 1.month).to_s, :from => "project_pledging_ends_on_2i"
    fill_in "Website", with: "http://www.example.com"
    fill_in "Team members", with: "Cool Guy, Cool Gal"
    fill_in "Image Filename", with: "project.png"

    click_button "Create Project"

    expect(current_path).to eq(project_path(Project.last))
    expect(page).to have_text("New Project Name")
    expect(page).to have_text("A kick-ass new project for your funding enjoyment")
    expect(page).to have_text("$50,000.00")
    # expect(page).to have_text("About 1 month remaining")
    expect(page).to have_text("http://www.example.com")
    expect(page).to have_text("Project successfully created!")
  end

  it "does not save the project if it's invalid" do
    visit new_project_url

    expect {
      click_button "Create Project"
    }.not_to change(Project, :count)

    expect(current_path).to eq(projects_path)
    expect(page).to have_text("error")
  end

  it "does not update the project if it's invalid" do
    project = Project.create(project_attributes)

    visit edit_project_url(project)

    fill_in "Name", with: " "

    click_button "Update Project"

    expect(page).to have_text("error")
  end
end
