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
class Department < ApplicationRecord
  belongs_to :user
  has_many :employees
  has_many :projects

  validates :name, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true

  # converting an Active Record object to a string
  def to_s
    name.capitalize()
  end

  # only column to search for
  def self.ransackable_attributes(_auth_object = nil)
    ['name']
  end
end
