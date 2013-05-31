class Category < ActiveRecord::Base
  attr_accessor :active
  attr_accessible :name, :sort
  has_many :products

  scope :sorted, order('sort DESC')

  validates :name, presence: true

  def initialize *args
    @active = false
    super
  end

end
