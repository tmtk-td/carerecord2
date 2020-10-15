class Client < ApplicationRecord
  validates :name, :sex, presence: true
  has_many :care_records
  mount_uploader :image, ImageUploader
end
