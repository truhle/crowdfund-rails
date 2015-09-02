def project_attributes(overrides={})
  {
    name: "Keezel",
    description: "One device, fits in your pocket and changes your online world. Now you control YOUR internet!",
    target_pledge_amount: 60000,
    pledging_ends_on: 1.month.from_now,
    website: "https://www.facebook.com/pages/Keezel/986939261325092",
    team_members: "Aike Müller, Friso Schmid",
    image_file_name: "keezel.jpg"
  }.merge(overrides)
end

def pledge_attributes(overrides={})
  {
    name: "Joe",
    email: "Joe@example.com",
    amount: 50,
    comment: "I'm so glad you are doing this!"
  }.merge(overrides)
end
