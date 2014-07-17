require 'test_helper'

class TimeRangeTest < ActiveSupport::TestCase
  def test_correct_time_range
    range = TimeRange.new 'begin' => Time.now, 'end' => Time.now - 1.day
    range.valid?
    assert range.errors[:end]
  end
end
