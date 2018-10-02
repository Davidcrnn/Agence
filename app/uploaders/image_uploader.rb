class ImageUploader < CarrierWave::Uploader::Base
 include Cloudinary::CarrierWave

version :sales_image do
    process :resize_to_fill => [600, 400]
  end

version :sales_show do
    process :resize_to_fill => [600, 400]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
