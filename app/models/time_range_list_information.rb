class TimeRangeListInformation < BasicInformation
  # include ListConcern
  has_many :lists, as: :list_information, dependent: :destroy
  has_many :list_items, through: :lists, dependent: :destroy
end
