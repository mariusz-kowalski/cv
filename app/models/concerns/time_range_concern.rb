module TimeRangeConcern
  extend ActiveSupport::Concern

  included do
    has_one :time_range, foreign_key: :information_id, dependent: :destroy
    accepts_nested_attributes_for :time_range
  end
end
