class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :mage
      t.integer :project_id
      t.string :project_token

      t.timestamps
    end
  end
end
