class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name, null: false, unique: true
      t.string :url, null: false, unique:true

      t.timestamps null: false
    end
  end
end
