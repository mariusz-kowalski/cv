require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  def test_up
    FactoryGirl.create :languages
    list_element = ListItem.find_by(name: 'german').list
    patch :update, id: list_element, list: {ordinal: 1}

    assert_redirected_to "/list_informations/#{list_element.list_information.id}/list_items"

    assert_equal 0, ListItem.find_by(name: 'polish').list.ordinal
    assert_equal 1, ListItem.find_by(name: 'german').list.ordinal
    assert_equal 2, ListItem.find_by(name: 'english').list.ordinal
    assert_equal 3, ListItem.find_by(name: 'spanish').list.ordinal
    assert_equal 4, ListItem.find_by(name: 'russian').list.ordinal
  end

  def test_down
    FactoryGirl.create :languages
    list_element = ListItem.find_by(name: 'english').list
    patch :update, id: list_element, list: {ordinal: 3}

    assert_redirected_to "/list_informations/#{list_element.list_information.id}/list_items"

    assert_equal 0, ListItem.find_by(name: 'polish').list.ordinal
    assert_equal 1, ListItem.find_by(name: 'spanish').list.ordinal
    assert_equal 2, ListItem.find_by(name: 'german').list.ordinal
    assert_equal 3, ListItem.find_by(name: 'english').list.ordinal
    assert_equal 4, ListItem.find_by(name: 'russian').list.ordinal
  end
end
