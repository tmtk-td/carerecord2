class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      # t.データ型 :カラム名
      t.string :name
      t.string :sex
      t.date :born_on
      t.integer :age
      t.string :information
      t.string :image
      t.integer :user_id
    end
  end
end
