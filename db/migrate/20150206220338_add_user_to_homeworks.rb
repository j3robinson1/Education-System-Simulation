class AddUserToHomeworks < ActiveRecord::Migration
  def change
    add_reference :homeworks, :user, index: true
    add_foreign_key :homeworks, :users
  end
end
