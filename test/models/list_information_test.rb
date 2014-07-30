require 'test_helper'

class ListInformationTest < ActiveSupport::TestCase
  def test_default_order
    list_informations = FactoryGirl.create :languages_random_order

    assert_equal ['russian', 'spanish', 'german', 'english', 'polish'], 
      list_informations.list_items.default_order.map(&:name)
  end
end
