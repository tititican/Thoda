class AddDefaultValueToFeaturedAttribute < ActiveRecord::Migration
  def up
  	change_column :projects, :featured, :boolean, :default => false
  end

  def down
  	change_column :projects, :featured, :boolean, :default => nil
  end
end
