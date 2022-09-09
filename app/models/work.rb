# == Schema Information
#
# Table name: works
#
#  id                :integer          not null, primary key
#  datetimeperformed :datetime
#  hours             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  project_id        :integer
#  user_id           :integer
#
# Indexes
#
#  index_works_on_project_id  (project_id)
#  index_works_on_user_id     (user_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#  user_id     (user_id => users.id)
#
class Work < ApplicationRecord

  belongs_to :user 
  belongs_to :project

  validates :project_id, presence: true 
  validates :user_id, presence: true 
  validates :datetimeperformed, presence: true
  validate :future_date
  validates :hours, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 8 }

  #returns items greater than or equl to 8
  scope :fullday, -> { where("hours >= 8") }

  #returns items where work was performed no less than 7 days ago
  #scope :recentwork, -> { where("datetimeperformed > '#{Time.now - 7.days}'") }

  #class method 
  def self.recently_worked_days(numDays)
    prevDate = Time.now - numDays.to_i.days 
    where("datetimeperformed > '#{prevDate}'")
  end

  # Custom validation
  # if a datetimeperformed item exists, make sure it's NOT greater than the current time
  def future_date 
    if datetimeperformed.present? && datetimeperformed > Time.now 
      errors.add(:datetimeperformed, "can't be a future date")
    end
  end

  # converting an Active Record object to a string
  def to_s
    "#{user}: #{datetimeperformed.strftime('%m/%d/%Y %H:%M')} - #{hours} hours"
  end
  
end
