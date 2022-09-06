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
class User < ApplicationRecord

  belongs_to :department
  has_many :works
  has_many :projects, through: :works  # many-to-many connection with projects, INNER JOIN

  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 5 }
  validates :department, presence: true

  # converting an Active Record object to a string
  def to_s
    "#{fname} #{lname}"
  end
  
end
