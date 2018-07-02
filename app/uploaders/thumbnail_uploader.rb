class ThumbnailUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big_thumb do
    process resize_to_fit: [500, 500]
  end

  version :medium_thumb do
    process resize_to_fit: [250, 250]
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
