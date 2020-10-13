class CreateCareRecordLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :care_record_labels do |t|
      t.references :care_record, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
