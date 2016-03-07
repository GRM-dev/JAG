class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :company, index: true, foreign_key: true
      t.references :responsibility, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
