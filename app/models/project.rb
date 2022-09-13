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
#  index_projects_on_user_id        (user_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#  user_id        (user_id => users.id)
#
class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :department
  has_many :works
  has_many :employees, through: :works # many-to-many connection with employees, INNER JOIN
  # belongs_to :employee

  validates :name, presence: true, length: { minimum: 5 }
  validates :department_id, presence: true
  validates :user_id, presence: true
  validates :rate, numericality: { only_integer: true, greater_than: 100, less_than: 15_000 }

  # returns items where rate is less than 200
  scope :lowrate, -> { where('rate < 200') }

  # converting an Active Record object to a string
  def to_s
    "#{name} (#{department})"
  end

  # class method
  # passes in projects collection, loops over each item and writes it as a row in the csv file
  def self.export_csv(projects)
    CSV.generate do |csv|
      csv << ['Name', 'Department', 'Rate', 'Created at', 'User', 'Recently Logged Work']
      projects.each do |project|
        csv << [
          project.name,
          project.department,
          project.rate,
          project.created_at,
          project.user.email,
          project.works.order('created_at DESC').first
        ]
      end
    end
  end
end
