require 'test_helper'

class ListItemsControllerTest < ActionController::TestCase
  def test_new
    work_place_A = FactoryGirl.create :work_place_A
    get :new, time_range_list_information_id: work_place_A
    assert_response :success
  end
  def test_create
    work_place_A = FactoryGirl.create :work_place_A
    put :create, time_range_list_information_id: work_place_A, list_item: {
      name: 'application developer',
      information_type: 'role',
      value: 'Many application administrate',
      description: 'Many many'
    }
    assert_redirected_to "/time_range_list_informations/#{work_place_A.id}/list_items"
    assert_equal 'Many application administrate', work_place_A.reload.list_items.first.value
  end

  def test_index
    list_item = FactoryGirl.create :sys_admin
    get :index, time_range_list_information_id: list_item.time_range_list_information
    assert_response :success
    assert response.body['sys admin']
  end

  def test_edit
    list_item = FactoryGirl.create :sys_admin
    get :edit, time_range_list_information_id: list_item.time_range_list_information, id: list_item
    assert_response :success
  end

  def test_update
    list_item = FactoryGirl.create :sys_admin
    patch :update, time_range_list_information_id: list_item.time_range_list_information, id: list_item, list_item: {
      name: 'sys admin',
      information_type: 'role',
      value: 'Debian, Centos, Ubuntu'
    }
    assert_redirected_to "/time_range_list_informations/#{list_item.time_range_list_information.id}/list_items"
    assert_equal 'Debian, Centos, Ubuntu', ListItem.find(list_item.id).value
  end

  def test_show
    list_item = FactoryGirl.create :sys_admin
    get :show, time_range_list_information_id: list_item.time_range_list_information, id: list_item
    assert_response :success
    assert response.body['sys admin']
  end

  def test_delete
    list_item = FactoryGirl.create :sys_admin
    delete :destroy, time_range_list_information_id: list_item.time_range_list_information, id: list_item
    assert_redirected_to "/time_range_list_informations/#{list_item.time_range_list_information.id}/list_items"
    assert_not ListItem.find_by(id: list_item.id)
  end
end
