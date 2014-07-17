class ListInformation < BasicInformation
  has_many :lists, dependent: :destroy
  has_many :list_items, through: :lists, dependent: :destroy
end
