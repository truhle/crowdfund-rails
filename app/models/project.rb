class Project < ActiveRecord::Base
  def expired?
    pledging_ends_on.past?
  end
end
