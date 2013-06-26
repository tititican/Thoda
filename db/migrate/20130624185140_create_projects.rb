class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :activitives
      t.string :location
      t.date :year
      t.text :desciption

      t.timestamps
    end
  end
end
