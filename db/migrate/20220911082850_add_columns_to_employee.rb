class AddColumnsToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :email, :string, unique: true
    add_column :employees, :phone, :string, unique: true        
  end
end
