class Project < ActiveRecord::Base
  def expired?
    pledging_ends_on < Date.today
  end

  def self.receiving_pledges
    Project.where("pledging_ends_on > ?", Time.now).order("pledging_ends_on")
  end
end
