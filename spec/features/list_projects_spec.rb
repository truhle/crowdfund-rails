
describe "Viewing the list of projects" do

  it "shows three project names" do
    project1 = Project.create(name: "Keezel",
                              description: "One device, fits in your pocket and changes your online world. Now you control YOUR internet!",
                              target_pledge_amount: 60000,
                              pledging_ends_on: "2015-09-01",
                              website: "https://www.facebook.com/pages/Keezel/986939261325092")

    project2 = Project.create(name: "Temple of Promise",
                              description: "The Temple Listens",
                              target_pledge_amount: 60000,
                              pledging_ends_on: "2015-06-17",
                              website: "http://www.templeofpromise.org/")

    project3 = Project.create(name: "Tower Unite",
                              description: "Online virtual world game with games, activities, media, and NO microtransactions.",
                              target_pledge_amount: 50000,
                              pledging_ends_on: "2015-08-15",
                              website: "http://www.towerunite.com/")


    visit projects_url

    expect(page).to have_text("3 Projects")
    expect(page).to have_text(project1.name)
    expect(page).to have_text(project2.name)
    expect(page).to have_text(project3.name)

    expect(page).to have_text(project1.description[0..10])
    expect(page).to have_text("$50,000.00")
    expect(page).to have_text(project1.website)
  end
end
