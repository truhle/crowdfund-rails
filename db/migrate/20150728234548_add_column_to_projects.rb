class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :website, :string
  end
end
