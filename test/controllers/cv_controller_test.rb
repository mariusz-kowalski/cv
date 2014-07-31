require 'test_helper'

class CvControllerTest < ActionController::TestCase
  def test_index
    FactoryGirl.create :names
    FactoryGirl.create :phone
    FactoryGirl.create :phone, value: '+48 500 500 500'
    FactoryGirl.create :address
    FactoryGirl.create :email
    FactoryGirl.create :email, value: 'john@example.com'
    get :index
    assert_response :success
    assert response.body['Joe John Yankovitch']
    assert response.body['+48 600 666 888']
    assert response.body['+48 500 500 500']
    assert response.body['Wall Street']
    assert response.body['joe@example.com']
    assert response.body['john@example.com']
  end

end
