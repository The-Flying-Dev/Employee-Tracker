class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, null: false, default: '', unique: true
    add_index :users, :email
  end
end
