class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :department, foreign_key: true
      t.integer :rate
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
