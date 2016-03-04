class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false

      t.references :role, default: 0
      t.references :profile, unique: true, null: false

      t.timestamps null: false
    end
  end
end
