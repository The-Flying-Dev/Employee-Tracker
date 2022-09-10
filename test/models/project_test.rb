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
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
