class CareRecord < ApplicationRecord
  validates :content, presence: true
  belongs_to :client
  has_many :comments, dependent: :destroy
  has_many :care_record_labels, dependent: :destroy, foreign_key: 'care_record_id'
  has_many :labels, through: :care_record_labels, source: :label
end
