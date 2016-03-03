class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :appointment
      t.string :url, null: false
      t.date :date_adv_added
      t.date :date_adv_link_added, null: false
      t.date :date_expiration
      t.boolean :verified, default: false
      t.date :date_last_verified, null: false, default: Time.now

      t.references :company
      t.references :job_category
      t.references :city
      t.references :site

      t.timestamps null: false
    end
  end
end
