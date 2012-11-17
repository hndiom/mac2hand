class Deal < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :board
  belongs_to :user
  has_many :photos
end
