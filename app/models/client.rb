class Client < ApplicationRecord
  has_many :care_records
  mount_uploader :image, ImageUploader
end
