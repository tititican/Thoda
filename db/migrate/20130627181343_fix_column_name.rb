class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :pictures, :mage, :image 
  end

  def down
  	rename_column :pictures, :image, :mage
  end
end
