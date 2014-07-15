class ListInformation < BasicInformation
  has_many :lists
  has_many :list_items, through: :lists
end
