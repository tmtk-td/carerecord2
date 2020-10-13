class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :care_record, foreign_key: true
      t.text :addcontent

      t.timestamps
    end
  end
end
