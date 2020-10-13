class CreateCareRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :care_records do |t|
    # t.データ型 :カラム名
    t.string :content
    t.date :content_date
    t.integer :user_id
    t.integer :client_id
    end
  end
end
