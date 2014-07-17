require 'test_helper'

class TimeRangeInformationsControllerTest < ActionController::TestCase
  def test_create
    put :create, time_range_information: { 
      name: 'University of Wrocław',
      value: 'Physics',
      time_range_attributes: {
        'begin' => '01/10/2010',
        'end' => '30/06/2013'
      }
    }

    assert_redirected_to "/time_range_informations"
    information = TimeRangeInformation.find_by(name: 'University of Wrocław')
    assert_equal 'Physics', information.value
    assert_equal '01/10/2010'.to_date, information.time_range.begin
    assert_equal '30/06/2013'.to_date, information.time_range.end
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_edit
    information = FactoryGirl.create :university_krakow
    get :edit, id: information
    assert_response :success
  end

  def test_update
    information = FactoryGirl.create :university_krakow
    patch :update, id: information, time_range_information: {
      value: 'Economy',
      time_range_attributes: { :end => '30/06/2012'}
    }
    assert_redirected_to "/time_range_informations"
    information.reload
    assert_equal 'Economy', information.value
    assert_equal '30/06/2012'.to_date, information.time_range.end
  end

  def test_index
    FactoryGirl.create :university_krakow
    get :index
    assert_response :success
  end

  def test_destroy
    information = FactoryGirl.create :university_krakow
    delete :destroy, id: information
    assert_redirected_to "/time_range_informations"
    assert_not TimeRangeInformation.find_by name: 'University of Kraków'
    assert_not TimeRange.find_by :begin => '01/01/2000'.to_date, 'end' => '01/01/2005'.to_date
  end
end
