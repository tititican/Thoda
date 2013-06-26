class Project < ActiveRecord::Base
  attr_accessible :activitives, :desciption, :location, :name, :year
  validates :name, :desciption, presence: true 
end
