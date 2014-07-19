class ListItem < BasicInformation
  has_one :list
  has_one :superinformation, through: :list

  validates_associated :list
end
