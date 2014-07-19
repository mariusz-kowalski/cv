class ListItem < BasicInformation
  has_one :list
  has_one :list_information, through: :list, source_type: :ListInformation
  has_one :time_range_list_information, through: :list, source: :list_information, source_type: :TimeRangeListInformation
  # has_one :time_range_list_information, through: :list, source: :list_information

  validates_associated :list
end
