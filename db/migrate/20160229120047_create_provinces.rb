class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
