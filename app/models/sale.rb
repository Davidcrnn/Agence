class Sale < ApplicationRecord
  belongs_to :user, optional: true
  validates :titre, presence: true
  validates :description, presence: true
  validates :surface, presence: true
  validates :price, presence: true
  validates :top, inclusion: { in: [ true, false ] }
  validates :visible, inclusion: {in: [true, false] }
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  mount_uploader :photo, PhotoUploader
end
