require 'test_helper'

class TimeRangeListInformationTest < ActiveSupport::TestCase
  def test_create_with_list
    information = TimeRangeListInformation.create! name: 'DSW', value: 'admin'
    assert information.list_items.create name: 'web develop', value: 'virtual dineary'
    assert information.list_items.create name: 'sys admin', value: 'linux'
  end
end
