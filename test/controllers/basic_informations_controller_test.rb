require 'test_helper'

class BasicInformationsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
  end

  def test_create
    put :create, basic_information: 
    { name: 'email', 
      information_type: 'email', 
      value: 'alan@machine.com',
      description: 'primary email'
    }
    assert_redirected_to basic_informations_path
    assert_equal 'alan@machine.com', BasicInformation.find_by(name: 'email').value
  end

  def test_index
    FactoryGirl.create :basic_information
    get :index
    assert_response :success
    assert_select 'a', 'alan@machine.com'
  end

  def test_edit
    basic_information = FactoryGirl.create :basic_information
    get :edit, id: basic_information
    assert_response :success
    assert_select 'form'
  end

  def test_update
    basic_information = FactoryGirl.create :basic_information
    patch :update, id: basic_information, basic_information: 
    { name: 'phone',
      information_type: 'phone number',
      value: '601 666 666',
      description: 'call me!' 
    }
    assert_redirected_to basic_informations_path
    assert_equal '601 666 666', BasicInformation.find_by(name: 'phone').value
  end

  def test_show
    basic_information = FactoryGirl.create :basic_information
    get :show, id: basic_information
    assert_response :success
    assert response.body['alan@machine.com']
  end

  def test_delete
    basic_information = FactoryGirl.create :basic_information
    delete :destroy, id: basic_information
    assert_redirected_to basic_informations_path
    assert_not BasicInformation.find_by id: basic_information.id
  end
end
