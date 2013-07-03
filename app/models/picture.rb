class Picture < ActiveRecord::Base
  attr_accessible :description, :image, :project_id, :project_token
  belongs_to :project

  mount_uploader :image, ImageUploader
end
