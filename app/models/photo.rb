class Photo < ApplicationRecord
  mount_uploader :photo_path, PhotoUploader
end
