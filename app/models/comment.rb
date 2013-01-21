# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :deal
  belongs_to :user
  validates_presence_of :content
end
