class TimeRangeInformation < BasicInformation
  has_one :time_range, dependent: :destroy
  accepts_nested_attributes_for :time_range
end
