class AddFileToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :file, :string
  end
end
