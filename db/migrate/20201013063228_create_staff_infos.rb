class CreateStaffInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_infos do |t|
      t.string "info"
      t.date "info_date"
      t.integer "user_id"
    end
  end
end
