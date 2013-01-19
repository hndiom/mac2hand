# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  # attr_accessible :title, :body
  include Rails.application.routes.url_helpers

  belongs_to :deal
  mount_uploader :photo, PhotoUploader

  def to_jq_upload
  {
    "name" => read_attribute(:photo),
    "size" => photo.size,
    "url" => photo.url,
    "thumbnail_url" => photo.tiny.url,
    "delete_url" => deal_photo_path(deal,id),
    "delete_type" => "DELETE",
  }
  end
end
