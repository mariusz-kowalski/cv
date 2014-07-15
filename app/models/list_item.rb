class ListItem < BasicInformation
  has_one :list
  has_one :list_information, through: :list
end
