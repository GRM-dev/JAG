class AddUserRoleToUser < ActiveRecord::Migration
  def change
    UserRole.create(name: 'user')
    UserRole.create(name: 'advertiser')
    UserRole.create(name: 'mod')
    UserRole.create(name: 'admin')
    UserRole.create(name: 'hadmin')
    add_reference :users, :user_role, index: true, foreign_key: true, default: UserRole.find(1)
  end
end
