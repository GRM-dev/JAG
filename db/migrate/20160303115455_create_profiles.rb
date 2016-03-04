class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender, default: 'undefined'

      t.references :user, unique: true

      t.timestamps null: false
    end
  end
end
