class Photo < ApplicationRecord
  mount_uploader :photo_path_string, PhotoUploader
end
