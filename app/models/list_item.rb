class ListItem < BasicInformation
  has_one :list
  has_one :list_information, through: :list

  validates_associated :list
  #validates :list_information, presence: :true
end
