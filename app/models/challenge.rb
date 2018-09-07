class Challenge < ApplicationRecord
  belongs_to :department
  validates :name, presence: true,
            length: { minimum: 3, maximum: 50 }
  # validate :end_after_start
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :goal, presence: true

 #  private
 #  def end_after_start
 #    return if end_date.blank? || start_date.blank?
 #
 #    if end_date < start_date
 #      errors.add(:end_date, "End date must be after the start date")
 #    end
 #
 #    if end_date < Date.today
 #      errors.add(:end_date "End date muste be in the future")
 #    end
 # end
end
