# -*- encoding : utf-8 -*-
class Deal < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :board
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos
end
