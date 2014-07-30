require 'test_helper'

class TimeRangeInformationTest < ActiveSupport::TestCase
  def test_create_with_time_range
    information = TimeRangeInformation.create!(
      name: 'University of Wrocław',
      value: 'Physics',
      time_range_attributes: { 'begin' => '01/10/2010', 'end' => '30/06/2013' }
    )
    assert_equal 'Physics', information.value 
    assert_equal '01/10/2010'.to_date, information.time_range.begin
  end

  def test_destroy_dependent
    information = FactoryGirl.create :university_krakow
    assert TimeRangeInformation.find_by name: 'University of Kraków'
    assert TimeRange.find_by :begin => '01/01/2000'.to_date, 'end' => '01/01/2005'.to_date
    information.destroy
    assert_not TimeRangeInformation.find_by name: 'University of Kraków'
    assert_not TimeRange.find_by :begin => '01/01/2000'.to_date, 'end' => '01/01/2005'.to_date
  end

  def test_default_order
    FactoryGirl.create :university_gdansk
    FactoryGirl.create :university_wroclaw
    FactoryGirl.create :university_torun
    FactoryGirl.create :university_krakow
    FactoryGirl.create :university_opole

    assert_equal [
      'University of Opole',
      'University of Wroclaw', 
      'University of Kraków', 
      'University of Torun', 
      'University of Gdansk' ] ,
      TimeRangeInformation.all.default_order.map(&:name).to_a
  end
end
