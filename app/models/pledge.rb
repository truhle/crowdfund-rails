class Pledge < ActiveRecord::Base
  validates :name, presence: true
  validates :email, format: /\S+@\S+/
  AMOUNTS = [25, 50, 100, 200, 500]
  validates :amount, inclusion: { in: AMOUNTS }

  belongs_to :project

end
