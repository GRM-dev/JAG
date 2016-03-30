class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender, default: 'NaN'

      t.references :user, unique: true, index: true

      t.timestamps null: false
    end
  end
end
