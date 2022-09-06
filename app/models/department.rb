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

  validates :name, presence: true, length: { minimum: 5 }

  # converting an Active Record object to a string
  def to_s 
    name
  end
end
