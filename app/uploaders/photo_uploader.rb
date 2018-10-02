class PhotoUploader < CarrierWave::Uploader::Base
   include Cloudinary::CarrierWave
  version :sales_image do
    process :resize_to_fill => [600, 400]
  end
end
