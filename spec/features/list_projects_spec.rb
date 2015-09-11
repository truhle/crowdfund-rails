
describe "Viewing the list of projects" do

  it "shows the projects stored in the database" do
    project1 = Project.create(name: "Keezel",
                              description: "One device, fits in your pocket and changes your online world. Now you control YOUR internet!",
                              target_pledge_amount: 60000,
                              pledging_ends_on: 1.week.from_now,
                              website: "https://www.facebook.com/pages/Keezel/986939261325092",
                              team_members: "Aike Müller, Friso Schmid",
                              image: open("#{Rails.root}/app/assets/images/keezel.jpg"))

    project2 = Project.create(name: "Temple of Promise",
                              description: "The Temple Listens",
                              target_pledge_amount: 60000,
                              pledging_ends_on: 1.month.from_now,
                              website: "http://www.templeofpromise.org/")

    project3 = Project.create(name: "Tower Unite",
                              description: "Online virtual world game with games, activities, media, and NO microtransactions.",
                              target_pledge_amount: 50000,
                              pledging_ends_on: 1.year.from_now,
                              website: "http://www.towerunite.com/")


    visit projects_url

    expect(page).to have_text(project1.name)
    expect(page).to have_text(project2.name)
    expect(page).to have_text(project3.name)

    expect(page).to have_text(project1.description[0..10])
    expect(page).to have_text("$50,000.00")
    expect(page).not_to have_text(project1.team_members)
    expect(page).to have_selector("img[src$='#{project1.image.url(:medium)}']")
  end

  it 'does not show a project that is no longer accepting pledges' do
    project = Project.create(project_attributes(pledging_ends_on: 1.month.ago))

    visit projects_url
    expect(page).not_to have_text(project.name)
  end

  it "lists projects in order of pledging ends on date" do
  project1 = Project.new(project_attributes(pledging_ends_on: 2.days.from_now))
  project1.save

  project2 = Project.new(project_attributes(pledging_ends_on: 1.day.from_now))
  project2.save

  visit projects_path

  projects_all = all(".project")
  expect(projects_all[0]["id"]).to eq("project_#{project2.id}")
  expect(projects_all[1]["id"]).to eq("project_#{project1.id}")
  end
end
