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
    pledging_ends_on: "2015-09-01",
    website: "https://www.facebook.com/pages/Keezel/986939261325092"
  },
  {
    name: "Temple of Promise",
    description: "The Temple Listens",
    target_pledge_amount: 60000,
    pledging_ends_on: "2015-06-17",
    website: "http://www.templeofpromise.org/"
  },
  {
    name: "Tower Unite",
    description: "Online virtual world game with games, activities, media, and NO microtransactions.",
    target_pledge_amount: 50000,
    pledging_ends_on: "2015-08-15",
    website: "http://www.towerunite.com/"
  },
  {
    name: "Love Meet Hope",
    description: "Ed Asner stars in this fantastical film full of love & imagination. We need your help to finish it!",
    target_pledge_amount: 37500,
    pledging_ends_on: "2015-08-15",
    website: "https://www.facebook.com/lovemeethope"
  }
  ])
