class Label < ApplicationRecord
  has_many :care_record_labels, dependent: :destroy, foreign_key: 'label_id'
  has_many :care_records, through: :care_record_labels, source: :care_record
end
