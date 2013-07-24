class Project < ActiveRecord::Base
  attr_accessible :activitives, :desciption, :location, :name, :year, :tag_list, :featured, :category_id, :owner, :nationality
  has_many :pictures, :dependent => :destroy
  belongs_to :category 
  validates :name, :desciption, presence: true 
  
  acts_as_taggable 
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
