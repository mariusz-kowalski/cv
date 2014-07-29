require 'test_helper'

class ListTest < ActiveSupport::TestCase
  def test_destroy
    FactoryGirl.create :languages
    ListItem.find_by(name: 'english').destroy

    assert_equal 0, ListItem.find_by(name: 'polish').list.ordinal
    assert_equal 1, ListItem.find_by(name: 'spanish').list.ordinal
    assert_equal 2, ListItem.find_by(name: 'german').list.ordinal
    assert_equal 3, ListItem.find_by(name: 'russian').list.ordinal
  end
end
