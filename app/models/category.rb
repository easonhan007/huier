class Category < ActiveRecord::Base
  attr_accessible :name, :sort
  has_many :products

  scope :sorted, order('sort DESC')

  validates :name, presence: true
end
