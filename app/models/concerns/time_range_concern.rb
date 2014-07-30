module TimeRangeConcern
  extend ActiveSupport::Concern

  included do
    has_one :time_range, foreign_key: :information_id, dependent: :destroy
    accepts_nested_attributes_for :time_range

    scope :default_order, ->{ 
      where('time_ranges.end is null').
      joins(:time_range).
      order('time_ranges.begin DESC') | 
        self.joins(:time_range).
        where('time_ranges.end is not null').
        order('time_ranges.end DESC, time_ranges.begin DESC')
    }
  end
end
