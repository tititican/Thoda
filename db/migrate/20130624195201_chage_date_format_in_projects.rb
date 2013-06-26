class ChageDateFormatInProjects < ActiveRecord::Migration
  def up
  	change_column :projects, :year, :integer
  end

  def down
  	change_column :projects, :year, :date
  end
end
