class CreateResponsibilities < ActiveRecord::Migration
  def change
    create_table :responsibilities do |t|
      t.string :resp

      t.timestamps null: false
    end
  end
end
