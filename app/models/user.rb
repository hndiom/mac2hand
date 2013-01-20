# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  extend OmniauthCallbacks
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :cellphone
  # attr_accessible :title, :body
  validates_presence_of :name, :email, :cellphone
  has_many :deals

  def has_cellphone?
    if self.cellphone.present?
      true
    else
      false
    end
  end
end
