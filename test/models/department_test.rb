# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  notes      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_departments_on_user_id  (user_id)
# 
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end  

  context 'validations' do    
    should validate_presence_of(:name)
    should validate_presence_of(:user_id)
    should validate_length_of(:name).is_at_least(5)
    should have_many(:projects)
    should have_many(:employees)
    should belong_to(:user), foreign_key: 'user_id'
  end

end
