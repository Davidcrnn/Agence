class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :rental
end
