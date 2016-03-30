class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, unique: true
      t.references :advert

      t.timestamps null: false
    end
  end
end
