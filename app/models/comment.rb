class Comment < ApplicationRecord
  validates :addcontent, presence: true
  belongs_to :care_record
end
