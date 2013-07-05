class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :description, :image, :project_id, :project_token
  belongs_to :project
  validate :image, presence: true
  mount_uploader :image, ImageUploader

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
