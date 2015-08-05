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

    click_button "Create Project"

    expect(current_path).to eq(project_path(Project.last))
    expect(page).to have_text("New Project Name")
    expect(page).to have_text("A kick-ass new project for your funding enjoyment")
    expect(page).to have_text("$50,000.00")
    # expect(page).to have_text("About 1 month remaining")
    expect(page).to have_text("http://www.example.com")

  end
end
