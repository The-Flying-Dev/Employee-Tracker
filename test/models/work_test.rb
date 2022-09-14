# == Schema Information
#
# Table name: works
#
#  id                :integer          not null, primary key
#  datetimeperformed :datetime
#  file              :string
#  hours             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :integer
#  project_id        :integer
#  user_id           :integer
#
# Indexes
#
#  index_works_on_employee_id  (employee_id)
#  index_works_on_project_id   (project_id)
#  index_works_on_user_id      (user_id)
#
# Foreign Keys
#
#  employee_id  (employee_id => employees.id)
#  project_id   (project_id => projects.id)
#  user_id      (user_id => users.id)
# 
require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  context 'validations' do 
    should validate_presence_of(:project_id)    
    should validate_presence_of(:employee_id)
    should validate_presence_of(:user_id)
    should validate_presence_of(:datetimeperformed) 
    should validate_numericality_of(:hours).only_integer.is_greater_than(0).is_less_than_or_equal_to(8)
    should belong_to(:user), foreign_key: 'user_id'
    should belong_to(:employee), foreign_key: 'employee_id'   
    should belong_to(:project), foreign_key: 'project_id' 
  end

end
