class Project < ActiveRecord::Base
  attr_accessible :activitives, :desciption, :location, :name, :year, :tag_list, :featured
  has_many :pictures, :dependent => :destroy
  validates :name, :desciption, presence: true 
  acts_as_taggable 
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
