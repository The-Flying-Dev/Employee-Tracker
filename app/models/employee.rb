# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  email         :string
#  fname         :string
#  lname         :string
#  phone         :string
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
  has_many :projects, through: :works # many-to-many connection with projects, INNER JOIN
  # has_many :projects

  validates :fname, presence: true, length: { minimum: 2 }
  validates :lname, presence: true, length: { minimum: 5 }
  validates :department, presence: true
  validates :user_id, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }

  # converting an Active Record object to a string
  def to_s
    "#{fname} #{lname}"
  end

  # class method
  # passes in projects collection, loops over each item and writes it as a row in the csv file
  def self.export_csv(employees)
    CSV.generate do |csv|
      csv << ['First Name', 'Last Name', 'Department', 'email', 'phone']
      employees.each do |employee|
        csv << [
          employee.fname,
          employee.lname,
          employee.department,
          employee.email,
          employee.phone
        ]
      end
    end
  end
end
