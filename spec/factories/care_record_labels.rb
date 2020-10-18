FactoryBot.define do
  factory :care_record_label, class: CareRecordLabel do
    label_id { 1 }
    care_record_id { 1 }
    association :care_record, factory: :care_record
  end
end