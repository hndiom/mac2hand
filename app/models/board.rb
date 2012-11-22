# -*- encoding : utf-8 -*-
class Board < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :deals

  #mount_uploader :image, ImageUploader
end
