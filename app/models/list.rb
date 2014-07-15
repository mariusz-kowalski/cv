class List < ActiveRecord::Base
  belongs_to :list_item
  belongs_to :list_information
end
