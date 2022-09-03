# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  name          :string
#  rate          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#
# Indexes
#
#  index_projects_on_department_id  (department_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#
class Project < ApplicationRecord

  belongs_to :department
  has_many :works
  has_many :users, through: :works  # many-to-many connection with users, INNER JOIN

  validates :name, presence: true, length: { minimum: 5 } 
  validates :department, presence: true
  validates :rate, numericality: { only_integer: true, greater_than: 100 , less_than: 15000 }

  #returns items where rate is less than 200
  scope :lowrate, -> { where("rate < 200") }
  

end
