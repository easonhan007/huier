class Product < ActiveRecord::Base
  attr_protected nil
  belongs_to :category
  has_attached_file :image, styles: { medium: '480x360>', thumb: '300x200>'}, default_url: '/assets/:style/missing.jpg'

  scope :picked, where(picked: true)

  validates :name, presence: true
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'

end
