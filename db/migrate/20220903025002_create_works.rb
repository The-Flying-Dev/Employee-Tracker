class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.references :employee, foreign_key: true
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :datetimeperformed
      t.integer :hours
      t.timestamps
    end
  end
end
