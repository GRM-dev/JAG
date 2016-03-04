class AddUserRoleToUser < ActiveRecord::Migration
  def change
    UserRole.create(id: 1, name: 'user')
    UserRole.create(id: 2, name: 'advertiser')
    UserRole.create(id: 3, name: 'mod')
    UserRole.create(id: 4, name: 'admin')
    UserRole.create(id: 5, name: 'hadmin')

    add_reference :users, :user_role, index: true, foreign_key: true, default: UserRole.find(1)
  end
end
