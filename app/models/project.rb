class Project < ActiveRecord::Base
  attr_accessible :activitives, :desciption, :location, :name, :year
  has_many :pictures, :dependent => :destroy
  validates :name, :desciption, presence: true 
end
