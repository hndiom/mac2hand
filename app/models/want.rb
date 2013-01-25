# -*- encoding : utf-8 -*-
class Want < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :category

  has_many :comments, :dependent => :destroy

  scope :is_published, where("published = 1")
  scope :recent, order("published_at DESC")

  validates_presence_of :name, :spec, :deliver_method, :price, :contact_by

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
