class PhotosUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  version :rentals_image do
    process :resize_to_fill => [600, 400]
  end
end
