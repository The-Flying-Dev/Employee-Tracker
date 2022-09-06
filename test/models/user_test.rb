# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  fname         :string
#  lname         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#
# Indexes
#
#  index_users_on_department_id  (department_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end