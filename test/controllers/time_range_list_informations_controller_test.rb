require 'test_helper'

class TimeRangeListInformationsControllerTest < ActionController::TestCase
  def test_create
    put :create, time_range_list_information: { 
      name: 'Work place A',
      value: 'application administrator',
      time_range_attributes: {
        'begin' => '01/10/2010',
        'end' => '30/06/2013'
      }
    }

    assert_redirected_to '/time_range_list_informations'
    information = TimeRangeListInformation.find_by(name: 'Work place A')
    assert_equal 'application administrator', information.value
    assert_equal '01/10/2010'.to_date, information.time_range.begin
    assert_equal '30/06/2013'.to_date, information.time_range.end
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_edit
    information = FactoryGirl.create :work_place_B
    get :edit, id: information
    assert_response :success
  end

  def test_update
    information = FactoryGirl.create :work_place_B
    patch :update, id: information, time_range_list_information: {
      value: 'Application administrator',
      time_range_attributes: { :end => '30/06/2012'}
    }
    assert_redirected_to '/time_range_list_informations'
    information.reload
    assert_equal 'Application administrator', information.value
    assert_equal '30/06/2012'.to_date, information.time_range.end
  end

  def test_index
    FactoryGirl.create :work_place_B
    get :index
    assert_response :success
  end

  def test_destroy
    information = FactoryGirl.create :work_place_B
    delete :destroy, id: information
    assert_redirected_to '/time_range_list_informations'
    assert_not TimeRangeListInformation.find_by name: 'place Bw'
    assert_not TimeRange.find_by :begin => '01/01/2000'.to_date, 'end' => '01/01/2005'.to_date
  end
end
