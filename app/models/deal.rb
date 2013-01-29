# -*- encoding : utf-8 -*-
class Deal < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :category

  has_many :photos, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  accepts_nested_attributes_for :photos

  acts_as_gmappable :process_geocoding => false
  geocoded_by :address
  after_validation :geocode 

  scope :is_published, where("published = ?",true)
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
  def gmaps4rails_title
    "#{self.name}"
  end
end
