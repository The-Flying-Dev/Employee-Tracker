class AddEmployeeToWorks < ActiveRecord::Migration[6.1]
  def change
    add_reference :works, :employee, foreign_key: true
  end
end
