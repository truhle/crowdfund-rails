describe "Viewing list of pledges" do

  it "shows the pledges for a specific project" do
    project1 = Project.create(project_attributes(name: "Keezel"))
    pledge1 = project1.pledges.create(pledge_attributes(amount: 50))
    pledge2 = project1.pledges.create(pledge_attributes(amount: 100))

    project2 = Project.create(project_attributes(name: "Airing"))
    pledge3 = project2.pledges.create(pledge_attributes(amount: 200))

    visit project_pledges_url(project1)

    expect(page).to have_text(pledge1.amount)
    expect(page).to have_text(pledge2.amount)

    expect(page).not_to have_text(pledge3.amount)
  end
end
