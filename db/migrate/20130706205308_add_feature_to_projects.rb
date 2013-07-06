class AddFeatureToProjects < ActiveRecord::Migration
  def up
	  add_column :projects, :featured, :boolean
	end

	def down
		remove_column :projects, :featured
	end
end
