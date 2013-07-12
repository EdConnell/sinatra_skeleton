class UserFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  process :resize_to_fill => [200, 200]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def store_dir
    'public/uploads/'
  end

end
