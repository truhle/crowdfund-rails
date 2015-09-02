describe "Creating a new pledge" do

  it 'saves the pledge if it is valid' do
    project = Project.create!(project_attributes)

    visit project_url(project)

    click_link 'Pledge!'

    expect(current_path).to eq(new_project_pledge_path(project))

    fill_in "Name", with: "Joe"
    fill_in "Email", with: "joe@example.com"
    select 50, from: "pledge_amount"
    fill_in "Comment", with: "What a great project!"

    click_button "Make Pledge"

    expect(current_path).to eq(project_pledges_path(project))

    expect(page).to have_text("Thank you for your pledge!")
  end

  it 'does not save a pledge if it is invalid' do
    project = Project.create!(project_attributes)

    visit new_project_pledge_url(project)

    expect {
      click_button "Make Pledge"
    }.not_to change(Pledge, :count)

    expect(page).to have_text('error')
  end

end
