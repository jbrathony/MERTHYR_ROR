# encoding: utf-8

class EventImageUploader < ImageUploader
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
#  def store_dir
#    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :landscape_big_thumb do
    process resize_to_fill: [764, 341]
  end

  version :portrait_big_thumb do
    process resize_to_fit: [324, 100000]
  end

  version :landscape_small_thumb do
    process resize_to_fill: [193, 139]
  end

  version :portrait_small_thumb do
    process resize_to_fit: [139, 100000]
  end

  version :f_thumb do
    process resize_to_fill: [100, 100]
  end

  version "f_small" do
    process resize_to_fill: [400, 247]
  end

  version "f_large" do
    process resize_to_fill: [770, 300]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
