# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :deal
  mount_uploader :photo, PhotoUploader
end
