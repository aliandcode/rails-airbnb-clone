class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  version :bright_face do
  cloudinary_transformation effect: "brightness:30", radius: 20,
    width: 150, height: 150, crop: :thumb, gravity: :face
  end

end
