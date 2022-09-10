# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  fname         :string
#  lname         :string
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
class Employee < ApplicationRecord

  belongs_to :user
  belongs_to :department
  has_many :works
  has_many :projects, through: :works  # many-to-many connection with projects, INNER JOIN
  #has_many :projects

  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 5 }
  validates :department, presence: true
  validates :user_id, presence: true 

  # converting an Active Record object to a string
  def to_s
    "#{fname} #{lname}"
  end
end
