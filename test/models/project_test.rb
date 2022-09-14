# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  name          :string
#  rate          :integer
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  user_id       :integer
#
# Indexes
#
#  index_projects_on_department_id  (department_id)
#  index_projects_on_slug           (slug) UNIQUE
#  index_projects_on_user_id        (user_id)
#
# Foreign Keys
# 
#  department_id  (department_id => departments.id)
#  user_id        (user_id => users.id)
# 
require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  context 'validations' do 
    should validate_presence_of(:name)
    should validate_presence_of(:department_id)
    should validate_presence_of(:user_id)
    should validate_length_of(:name).is_at_least(5)
    should validate_numericality_of(:rate).only_integer.is_greater_than(100).is_less_than(15000)    
    should have_many(:works)
    should have_many(:employees)
    should belong_to(:user), foreign_key: 'user_id'
    should belong_to(:department), foreign_key: 'department_id'   
  end
  
end
