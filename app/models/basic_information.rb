class BasicInformation < ActiveRecord::Base
  scope :default_order, ->{ order(:created_at) }
end
