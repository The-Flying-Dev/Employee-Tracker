# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  email         :string
#  fname         :string
#  lname         :string
#  phone         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  user_id       :integer
#
# Indexes
#
#  index_employees_on_department_id  (department_id)
#  index_employees_on_user_id        (user_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#  user_id        (user_id => users.id)
# 
require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true 
  # end

  context 'validations' do    
    should validate_presence_of(:fname)
    should validate_presence_of(:lname)
    should validate_presence_of(:email)
    should validate_presence_of(:department)
    should validate_presence_of(:user_id)
    should validate_uniqueness_of(:email)
    should validate_length_of(:fname).is_at_least(2)
    should validate_length_of(:lname).is_at_least(5)
    should have_many(:works)
    should have_many(:projects)
    should belong_to(:user), foreign_key: 'user_id'
    should belong_to(:department)
  end
  
end
