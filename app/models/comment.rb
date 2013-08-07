# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :deal
  belongs_to :user
  validates_presence_of :content

  def is_hidden?
    hidden
  end

  def can_be_read_by(user)
    if user == self.user or user == self.deal.user
      true
    else
      false
    end
  end
end
