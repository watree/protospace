class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    '/uploads/noimage.png'
  end



  version :thumb do
    process :resize_to_fit => [64, 64]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
