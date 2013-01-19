# -*- encoding : utf-8 -*-
class Deal < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :photos
  belongs_to :category
  accepts_nested_attributes_for :photos

  scope :is_published, where("published = 1")
  scope :recent, order("published_at DESC")

  def publish
    self.published = true
    self.published_at = DateTime.current()
    self.save!
  end

  def cancel_publish
    self.published = false
    self.save!
  end

  def is_published?
    if self.published == true
      true
    else
      false
    end
  end
end
