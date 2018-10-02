class PictureUploader < CarrierWave::Uploader::Base
   include Cloudinary::CarrierWave
version :rentals_image do
    process :resize_to_fill => [600, 400]
  end

version :rentals_show do
    process :resize_to_fill => [600, 400]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
