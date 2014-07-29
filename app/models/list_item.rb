class ListItem < BasicInformation
  has_one :list, dependent: :destroy
  has_one :superinformation, through: :list

  validates_associated :list

  scope :default_order, ->{ order('lists.ordinal') }
end
