require 'test_helper'

class ListItemsControllerTest < ActionController::TestCase
  def test_new
    programing_languages = FactoryGirl.create :programing_languages
    get :new, list_information_id: programing_languages
    assert_response :success
  end
  def test_create
    programing_languages = FactoryGirl.create :programing_languages
    put :create, list_information_id: programing_languages, list_item: {
      name: 'ruby',
      information_type: 'skill',
      value: '5',
      description: '2 years of professional experience'
    }
    assert_redirected_to "/list_informations/#{programing_languages.id}/list_items"
    assert_equal '5', programing_languages.reload.list_items.first.value
  end

  def test_create_multiple_for_order_test
    list_item = FactoryGirl.create :ruby
    programing_languages = list_item.superinformation
    put :create, list_information_id: programing_languages, list_item: {
      name: 'java script',
      information_type: 'skill',
      value: '1',
      description: 'no professional experience'
    }
    assert_redirected_to "/list_informations/#{programing_languages.id}/list_items"
    assert_equal '1', programing_languages.reload.list_items.find_by(name: 'java script').value
  end

  def test_index
    list_item = FactoryGirl.create :ruby
    get :index, list_information_id: list_item.superinformation
    assert_response :success
    assert response.body['ruby']
  end

  def test_edit
    list_item = FactoryGirl.create :ruby
    get :edit, list_information_id: list_item.superinformation, id: list_item
    assert_response :success
  end

  def test_update
    list_item = FactoryGirl.create :ruby
    patch :update, list_information_id: list_item.superinformation, id: list_item, list_item: {
      name: 'ruby',
      information_type: 'skill',
      value: '4',
      description: '1 years of professional experience'
    }
    assert_redirected_to "/list_informations/#{list_item.superinformation.id}/list_items"
    assert_equal '4', ListItem.find(list_item.id).value
  end

  def test_show
    list_item = FactoryGirl.create :ruby
    get :show, list_information_id: list_item.superinformation, id: list_item
    assert_response :success
    assert response.body['ruby']
  end

  def test_delete
    FactoryGirl.create :languages_random_order
    list_item = ListItem.find_by(name: 'spanish')
    delete :destroy, list_information_id: list_item.superinformation, id: list_item
    
    assert_redirected_to "/list_informations/#{list_item.superinformation.id}/list_items"
    assert_not ListItem.find_by(id: list_item.id)

    assert_equal 0, ListItem.find_by(name: 'russian').list.ordinal
    assert_equal 1, ListItem.find_by(name: 'german').list.ordinal
    assert_equal 2, ListItem.find_by(name: 'english').list.ordinal
    assert_equal 3, ListItem.find_by(name: 'polish').list.ordinal
  end
end
