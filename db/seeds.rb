# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create!([
  {
    name: "Keezel",
    description: "One device, fits in your pocket and changes your online world. Now you control YOUR internet!",
    target_pledge_amount: 60000,
    pledging_ends_on: Time.now + 1.month,
    website: "https://www.facebook.com/pages/Keezel/986939261325092",
    team_members: "Aike Müller, Friso Schmid",
    image_file_name: "keezel.jpg"
  },
  {
    name: "Temple of Promise",
    description: "The Temple Listens",
    target_pledge_amount: 60000,
    pledging_ends_on: Time.now + 15.days,
    website: "http://www.templeofpromise.org/",
    team_members: "Sharma Hendel, Gloria Beck, Smooch Es, Carlie Jones, April Jones, Melissa Kirk, Yan Budman, Jazz Tigan",
    image_file_name: "templeofpromise.png"
  },
  {
    name: "Tower Unite",
    description: "Online virtual world game with games, activities, media, and NO microtransactions.",
    target_pledge_amount: 50000,
    pledging_ends_on: Time.now + 20.days,
    website: "http://www.towerunite.com/",
    team_members: "PixelTail Games, William Smith, Scott Kauker, Andy Garcia, Samuel Maddock, Matt Young, Damonic Cobley, Zachary Blystone, Macklin Guy",
    image_file_name: "towerunite.png"

  },
  {
    name: "Love Meet Hope",
    description: "Ed Asner stars in this fantastical film full of love & imagination. We need your help to finish it!",
    target_pledge_amount: 37500,
    pledging_ends_on: Time.now + 2.months,
    website: "https://www.facebook.com/lovemeethope",
    team_members: "Amanda Markowitz, Victoria Matlock, Justin Giddings, Brad Fowler, Andy Wizenberg",
    image_file_name: "lovemeethope.jpg"
  }
  ])

  project = Project.find_by(name: "Keezel")
  project.pledges.create!(name: "Joe", email: "joe@example.com", amount: 50, comment: "I'm so glad you are doing this!")
  project.pledges.create!(name: "Larry", email: "larry@example.com", amount: 50, comment: "This is a great project!")
  project.pledges.create!(name: "Molly", email: "molly@example.com", amount: 200, comment: "Awesome!")

  project = Project.find_by(name: "Temple of Promise")
  project.pledges.create!(name: "Joe", email: "joe@example.com", amount: 50, comment: "Beauty")
  project.pledges.create!(name: "Molly", email: "Molly@example.com", amount: 50, comment: "So looking forward to this!")
