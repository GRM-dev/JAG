class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :name, null: false, unique: true, default: 'user'

      # t.timestamps null: false
    end
  end
end
