class AddDetailsToCareRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :care_records, :created_at, :datetime
    add_column :care_records, :updated_at, :datetime
  end
end
