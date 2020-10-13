class CareRecordLabel < ApplicationRecord
  belongs_to :care_record, optional: true
  belongs_to :label, optional: true
end
