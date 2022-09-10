# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  fname                  :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  lname                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  department_id          :integer
#
# Indexes
#
#  index_users_on_department_id         (department_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :department
  has_many :works
  has_many :projects, through: :works  # many-to-many connection with projects, INNER JOIN
  has_many :projects

  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 5 }
  validates :department, presence: true

  # converting an Active Record object to a string
  def to_s
    "#{fname} #{lname}"
  end
  
end
