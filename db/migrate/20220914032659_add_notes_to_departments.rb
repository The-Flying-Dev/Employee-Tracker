class AddNotesToDepartments < ActiveRecord::Migration[6.1]
  def change
    add_column :departments, :notes, :string
  end
end
