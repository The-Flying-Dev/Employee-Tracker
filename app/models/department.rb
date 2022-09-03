# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Department < ApplicationRecord

  has_many :users 
  has_many :projects

  validates :name, length: { minimum: 5 }
end
