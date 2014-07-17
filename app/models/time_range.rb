class TimeRange < ActiveRecord::Base
  self.primary_key = :time_range_information_id

  belongs_to :time_range_information

  validate :validate_time_range

  private
  def validate_time_range
    return if self.end.blank? || self.begin.blank?
    if self.end < self.begin
      errors.add(:end, "must be after begin date")
    end
  end
end
