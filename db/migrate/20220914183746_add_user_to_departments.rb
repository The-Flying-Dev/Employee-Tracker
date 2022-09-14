class AddUserToDepartments < ActiveRecord::Migration[6.1]
  def change
    add_reference :departments, :user, foreign_key: true
  end
end
