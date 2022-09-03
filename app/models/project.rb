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
end
