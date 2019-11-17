class Image < ApplicationRecord
  mount_uploader :file_name, PictureUploader
  has_many :items
end
