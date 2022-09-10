class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.references :department, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
