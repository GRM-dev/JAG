class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.belongs_to :advert

      t.timestamps null: false
    end
  end
end
